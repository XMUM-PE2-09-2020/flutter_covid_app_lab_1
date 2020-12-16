import 'package:flutter_covid_app_lab_1/Models/user.dart';
import 'database_helper.dart';

//Author: Ting Sen
class RestData {
  DatabaseHelper databaseHelper = DatabaseHelper();
  static final baseUrl = "";
  static final loginUrl = baseUrl + "/";

  Future<int> createUser(User user) async {
    var dbClient = await databaseHelper.db;
    int res = await dbClient.insert(
      DatabaseHelper.table,
      user.toMap(),
    );
    return res;
  }

  Future<User> login(String username, String password) async {
    var dbClient = await databaseHelper.db;
    var result = await dbClient.rawQuery(
      'SELECT * FROM ${DatabaseHelper.table} WHERE ${DatabaseHelper.columnUsername} = ? AND ${DatabaseHelper.columnPassword} = ?',
      [username, password],
    );
    User user = User.map(result.first);
    return user;
  }
}
