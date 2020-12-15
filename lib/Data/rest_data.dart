import 'package:flutter_covid_app_lab_1/Models/user.dart';
import 'package:flutter_covid_app_lab_1/Utils/network_util.dart';

import 'database_helper.dart';

//Author: Ting Sen
class RestData {
  // ignore: unused_field
  NetworkUtil _netUtil = NetworkUtil();
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
    var result = dbClient.rawQuery(
      'SELECT * FROM ${DatabaseHelper.table} WHERE ${DatabaseHelper.columnUsername} = ? AND ${DatabaseHelper.columnPassword} = ?',
      [username, password],
    );
    print(result);
    User user = User.map(result);
    return user;
  }
}
