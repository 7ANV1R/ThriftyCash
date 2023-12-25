import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../common/ui/logger.dart';
import '../local_db/trx_data_db.dart';
import '../local_db/user_info_db.dart';

class DatabaseServices {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<String> get _dbPath async {
    return join(await getDatabasesPath(), 'cash.db');
  }

  Future<Database> _initDatabase() async {
    final path = await _dbPath;
    LoggerManager.yellow(path);
    return openDatabase(path, version: 1, onCreate: onCreate, singleInstance: true);
  }

  Future<void> truncateAllData() async {
    await UserInfoDB().truncateData();
    await TrxDataDB().truncateData();
  }

  Future<void> onCreate(Database db, int version) async {
    await UserInfoDB().createTable(db);
    await TrxDataDB().createTable(db);
  }
}
