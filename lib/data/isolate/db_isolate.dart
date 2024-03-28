import 'dart:async';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:synchronized/synchronized.dart';
import '../../const/env_const.dart';
import '../api/db_download_api.dart';
import '../local_db/collections/personal_info/personal_info_collection.dart';
import '../local_db/collections/trx_category/trx_category_collection.dart';
import '../local_db/collections/trx_model/trx_collection.dart';

import '../../common/ui/logger.dart';
import '../local_db/db.dart';

final mainThredBulkInsertReceivePort = ReceivePort();

final lock = Lock();

Future<void> bulkInsertIsolate({required User user}) async {
  try {
    final token = ServicesBinding.rootIsolateToken!;

    final isolate = await Isolate.spawn(
      _bulkInsertIsolateEngine,
      [mainThredBulkInsertReceivePort.sendPort, user, token],
    );

    isolate.addOnExitListener(mainThredBulkInsertReceivePort.sendPort, response: 'Exit');
  } catch (e) {
    LoggerManager.red('Isolate Error: $e');
  }
}

Future<void> _bulkInsertIsolateEngine(List v) async {
  try {
    lock.synchronized(() async {
      BackgroundIsolateBinaryMessenger.ensureInitialized(
        v.last as RootIsolateToken,
      );
      final sendPort = v.first as SendPort;
      await initDB();
      // await db.clear();
      final user = v[1] as User;

      // api
      final api = DBDownloadAPI(baseURL: EnvConst.supabaseAPIUrl, apiHeader: EnvConst.apiHeader);
      // send api request
      final personalInfoData = await api.downloadPersonalInfo(userUUID: user.id.toString());
      personalInfoData.fold((l) => sendPort.send('Err'), (personalInfo) async {
        final categoryData = await api.downloadAllCategoryData(userID: personalInfo.id.toString());
        categoryData.fold((l) => sendPort.send('Err'), (trxCategoryData) async {
          final trxData = await api.downloadAllTrx(userUUID: user.id.toString());

          trxData.fold((l) => sendPort.send('Err'), (trxList) async {
            // insert to db
            await db.writeTxn(() async {
              await db.personalInfos.put(personalInfo);
              await db.trxCategorys.putAll(trxCategoryData);
              for (var i = 0; i < trxList.length; i++) {
                final cat = trxCategoryData.firstWhere((element) => element.id == trxList[i].categoryID);
                final trx = trxList[i]..category.value = cat;
                await db.transactions.put(trx);
                await trx.category.save();
              }
              sendPort.send('Done');

              Isolate.current.kill(
                priority: Isolate.beforeNextEvent,
              );
            });
          });
        });
      });
    });
  } catch (e) {
    LoggerManager.red('Error: $e');
  }
}
