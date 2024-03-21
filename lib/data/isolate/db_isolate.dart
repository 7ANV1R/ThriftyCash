import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:synchronized/synchronized.dart';
import 'package:thrifycash/data/local_db/collections/trx_category_collection.dart';
import 'package:thrifycash/data/local_db/db.dart';

import '../../common/ui/logger.dart';

final mainThredBulkInsertReceivePort = ReceivePort();

final lock = Lock();

Future<void> bulkInsertIsolate() async {
  try {
    LoggerManager.green('Isolate bulkInsertIsolate');
    final token = ServicesBinding.rootIsolateToken!;

    final isolate = await Isolate.spawn(_isolate, [mainThredBulkInsertReceivePort.sendPort, token]);

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
      final sendPost = v.first as SendPort;
      // insert
      await initDB();
      final inexCategory = TrxCategory()
        ..emoji = '🤑'
        ..name = 'Income';
      await db.writeTxnSync(() async {
        db.trxCategorys.putSync(inexCategory);
      });
      sendPost.send('Done');
    });
  } catch (e) {
    LoggerManager.red('Error: $e');
  }
}
