import 'package:flutter_covid_app_lab_1/Models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

//Author: Ting Sen, Zehao
class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  static final _databaseName = "CoronaTracker.db";
  static final _databaseVersion = 1;

  static final table = 'User';

  static final columnId = '_id';
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
      $columnId INTEGER PRIMARY KEY, 
      $columnUsername TEXT NOT NULL, 
      $columnPassword TEXT NOT NULL, 
      $columnEmail TEXT NOT NULL, 
      $columnPhoneNumber INTEGER NOT NULL
    )
    ''');
    print("Table is created");
  }

  //Registration
  Future<int> createUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert(
      table,
      user.toMap(),
    );
    return res;
  }

  //Login
  Future<User> login(var phoneOrEmail, String password) async {
    var dbClient = await db;
    List<String> columnsToSelect = [
      DatabaseHelper.columnId,
      DatabaseHelper.columnEmail,
      DatabaseHelper.columnPhoneNumber,
      DatabaseHelper.columnPassword
    ];
    String whereString =
        '(${DatabaseHelper.columnEmail} = $phoneOrEmail OR ${DatabaseHelper.columnPhoneNumber} = $phoneOrEmail) AND ${DatabaseHelper.columnPassword} = $password';
    int rowId = 1;
    List<dynamic> whereArguments = [rowId];
    List<Map> result = await dbClient.query(
      DatabaseHelper.table,
      columns: columnsToSelect,
      where: whereString,
      whereArgs: whereArguments,
    );
    User user = User.map(result);
    return user;
  }
}
