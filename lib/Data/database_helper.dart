import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

//Author: Ting Sen, Zehao
class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  static final _databaseName = "CoronaTracker2.db";
  static final _databaseVersion = 1;

  static final table = 'User';

  static final columnUsername = 'username';
  static final columnPassword = 'password';
  static final columnPhoneNumber = 'phone_number';
  static final columnEmail = 'email';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(
      documentDirectory.path,
      _databaseName,
    );
    var ourDb = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
      $columnUsername TEXT PRIMARY KEY, 
      $columnPassword TEXT NOT NULL, 
      $columnEmail TEXT NOT NULL, 
      $columnPhoneNumber INTEGER NOT NULL
    )
    ''');
    print("Table is created");
  }
}
