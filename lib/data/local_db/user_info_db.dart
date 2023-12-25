import 'package:sqflite/sqflite.dart';

import '../services/local_db_services.dart';

class UserInfoDB {
  final tableName = 'user_info';

  Future<void> createTable(Database db) async {
    await db.execute('''
     CREATE TABLE `$tableName` (
 `local_id` INTEGER PRIMARY KEY AUTOINCREMENT,
 `id` bigint unsigned NULL,
 `user_id` text DEFAULT NULL,
 `name` text DEFAULT NULL,
 `dp_url` text DEFAULT NULL,
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
