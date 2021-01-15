import 'package:flutter_covid_app_lab_1/model/travel_history.dart';
import 'package:flutter_covid_app_lab_1/model/user.dart';
import 'database_helper.dart';

//Author: Ting Sen
class RestData {
  DatabaseHelper databaseHelper = DatabaseHelper();
  static final baseUrl = "";
  static final loginUrl = baseUrl + "/";

  Future<bool> createUser(User user) async {
    var dbClient = await databaseHelper.db;

    var query = await dbClient.rawQuery(
      'SELECT * FROM ${DatabaseHelper.tableUsers} WHERE ${DatabaseHelper.columnUsername} = ?',
      [user.username],
    );

    if (query.isNotEmpty) {
      return false;
    }

    var res = await dbClient.insert(
      DatabaseHelper.tableUsers,
      user.toJson(),
    );

    if (res == -1) {
      return false;
    } else {
      return true;
    }
  }

  Future<User> login(String username, String password) async {
    var dbClient = await databaseHelper.db;
    var result = await dbClient.rawQuery(
      'SELECT * FROM ${DatabaseHelper.tableUsers} WHERE ${DatabaseHelper.columnUsername} = ? AND ${DatabaseHelper.columnPassword} = ?',
      [username, password],
    );
    User user = User.map(result.first);
    return user;
  }

  Future<bool> logTravelHistory(TravelHistory entry) async {
    var dbClient = await databaseHelper.db;

    var res = await dbClient.insert(
      DatabaseHelper.tablePlaces,
      entry.toJson(),
    );

    if (res == -1) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<TravelHistory>> getTravelHistory(String username) async {
    List<TravelHistory> history = [];
    var dbClient = await databaseHelper.db;

    var result = await dbClient.rawQuery(
      'SELECT * FROM ${DatabaseHelper.tablePlaces} WHERE ${DatabaseHelper.columnUsername} = ?',
      [username],
    );

    for (var n in result) {
      history.add(TravelHistory.map(n));
    }
    
    return history;
  }
}
