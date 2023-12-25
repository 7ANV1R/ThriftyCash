import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../common/ui/logger.dart';

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
    // await BranchesDB().truncateData();
    // await UsersDB().truncateData();
    // await CustomersDB().truncateData();
    // await CustomersBankInfoDB().truncateData();
    // await TransactionsDB().truncateData();
  }

  Future<void> onCreate(Database db, int version) async {
    // await BranchesDB().createTable(db);
    // await UsersDB().createTable(db);
    // await CustomersDB().createTable(db);
    // await CustomersBankInfoDB().createTable(db);
    // await TransactionsDB().createTable(db);
  }
}
