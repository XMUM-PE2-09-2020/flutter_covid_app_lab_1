import 'package:flutter_covid_app_lab_1/Models/user.dart';
import 'package:flutter_covid_app_lab_1/Utils/network_util.dart';

import 'database_helper.dart';

//Author: Ting Sen
class RestData {
  NetworkUtil _netUtil = NetworkUtil();
  DatabaseHelper databaseHelper = DatabaseHelper();
  static final baseUrl = "";
  static final loginUrl = baseUrl + "/";

  Future<User> login(var phoneOrEmail, String password) async {
    var dbClient = await databaseHelper.db;
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
