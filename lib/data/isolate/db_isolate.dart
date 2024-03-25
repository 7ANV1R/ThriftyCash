import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:synchronized/synchronized.dart';
import 'package:thrifycash/const/env_const.dart';
import 'package:thrifycash/data/api/db_download_api.dart';
import 'package:thrifycash/data/local_db/collections/personal_info/personal_info_collection.dart';
import 'package:thrifycash/data/local_db/collections/trx_category/trx_category_collection.dart';

import '../../common/ui/logger.dart';
import '../local_db/db.dart';

final mainThredBulkInsertReceivePort = ReceivePort();

final lock = Lock();

Future<void> bulkInsertIsolate({required User user}) async {
  try {
    final token = ServicesBinding.rootIsolateToken!;

    final isolate = await Isolate.spawn(_isolate, [mainThredBulkInsertReceivePort.sendPort, user, token]);

    isolate.addOnExitListener(mainThredBulkInsertReceivePort.sendPort, response: 'Exit');
  } catch (e) {
    LoggerManager.red('Isolate Error: $e');
  }
}

Future<void> _isolate(List v) async {
  try {
    lock.synchronized(() async {
      BackgroundIsolateBinaryMessenger.ensureInitialized(
        v.last as RootIsolateToken,
      );
      final database = await initDB();
      final sendPort = v.first as SendPort;
      final user = v[1] as User;

      // data
      PersonalInfo? personalInfoVar;
      List<TrxCategory>? categoryList;

      // api
      final api = DBDownloadAPI(baseURL: EnvConst.supabaseAPIUrl, apiHeader: EnvConst.apiHeader);
      // send api request
      final personalInfoData = await api.downloadPersonalInfo(userUUID: user.id.toString());
      personalInfoData.fold((l) => sendPort.send('Err'), (personalInfo) async {
        personalInfoVar = personalInfo;
        final categoryData = await api.downloadAllCategoryData(userID: personalInfo.id.toString());
        categoryData.fold((l) => sendPort.send('Err'), (r) async {
          categoryList = r;
        });
      });

      // insert to db
      await database.writeTxnSync(() async {
        if (personalInfoVar != null) database.personalInfos.putSync(personalInfoVar!);
        if (categoryList != null) database.trxCategorys.putAllSync(categoryList!);
        sendPort.send('Done');
      });
    });
  } catch (e) {
    LoggerManager.red('Error: $e');
  }
}
