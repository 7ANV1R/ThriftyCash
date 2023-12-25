import 'package:sqflite/sqflite.dart';

import '../services/local_db_services.dart';

class TrxDataDb {
  final tableName = 'trx_data';

  Future<void> createTable(Database db) async {
    await db.execute('''
     CREATE TABLE `$tableName` (
 `local_id` INTEGER PRIMARY KEY AUTOINCREMENT,
 `id` bigint unsigned NULL,
 `user_id` text DEFAULT NULL,
 `is_expense` tinyint unsigned NOT NULL DEFAULT '1'
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

  Future<void> truncateData() async {
    final db = await DatabaseServices().database;

    await db.rawQuery("Delete from $tableName");
    await db.rawQuery('DELETE FROM SQLITE_SEQUENCE WHERE name=?', [tableName]);
  }
}
