import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import '../../common/ui/logger.dart';
import '../model/trx_data_model.dart';

import '../services/local_db_services.dart';

final trxDataDBProvider = Provider((ref) {
  return TrxDataDB();
});

class TrxDataDB {
  final tableName = 'trx_data';

  Future<void> createTable(Database db) async {
    await db.execute('''
     CREATE TABLE `$tableName` (
 `local_id` INTEGER PRIMARY KEY AUTOINCREMENT,
 `id` bigint unsigned NULL,
 `user_id` text DEFAULT NULL,
 `is_expense` tinyint unsigned NOT NULL DEFAULT '1',
 `amount` real NOT NULL DEFAULT '0.0',
 `note` text DEFAULT NULL,
 `attachment` text DEFAULT NULL,
 `attachment_local_path` text DEFAULT NULL,
 `trx_type` text DEFAULT NULL,
 `created_at` timestamp NULL DEFAULT NULL,
 `updated_at` timestamp NULL DEFAULT NULL,
 `need_to_sync` tinyint unsigned NOT NULL DEFAULT '0'
)
    ''');
  }

  Future<void> batchInsertData(List<Map<String, dynamic>> data) async {
    final db = await DatabaseServices().database;
    LoggerManager.green('batchInsertData $data');
    var batch = db.batch();
    for (var i = 0; i < data.length; i++) {
      LoggerManager.green('batchInsertData ${data[i]}');
      batch.insert(
        tableName,
        data[i],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit();
  }

  Future<void> truncateData() async {
    final db = await DatabaseServices().database;

    await db.rawQuery("Delete from $tableName");
    await db.rawQuery('DELETE FROM SQLITE_SEQUENCE WHERE name=?', [tableName]);
  }

  Future<List<TrxDataModel>> fetchAllTrx() async {
    try {
      final db = await DatabaseServices().database;

      final trxs = await db.rawQuery("SELECT * FROM $tableName ORDER BY created_at DESC");
      LoggerManager.green("[fetchAllTrx] $trxs");
      final trxList = trxs.map((e) => TrxDataModel.fromMap(e)).toList();
      return trxList;
    } catch (e, st) {
      LoggerManager.red("[fetchAllTrx] ERR: $e, $st");
      throw Exception(e);
    }
  }
}
