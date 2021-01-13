import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/model/country_cases.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_base.dart';
import 'package:flutter_covid_app_lab_1/model/covid19_notify_model.dart';
import 'package:flutter_covid_app_lab_1/model/covid19_total_model.dart';
import 'package:flutter_covid_app_lab_1/model/covid19_week_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_covid_app_lab_1/http/http_handler.dart';
import 'package:flutter_covid_app_lab_1/api/api_covid19.dart';
import 'package:http/http.dart' as http;

class Covid19VM extends BaseVM {
  static Covid19VM of(BuildContext context, [bool listen = false]) =>
      (listen ? context.watch<Covid19VM>() : context.read<Covid19VM>())
        ..context = context;
  Covid19WeekModel covid19weekModel;
  Covid19TotalModel covid19totalModel;
  Covid19NotifyModel covid19notifyModel;

  Future<void> covid19WeedGet() async {
    Covid19WeekApi api = Covid19WeekApi();
    api.heards = {
      "x-rapidapi-key": "15a5f98aa8msh562d9ee429d0004p124703jsnbd5dd202af0e",
      "x-rapidapi-host": "coronavirus-map.p.rapidapi.com"
    };
    api.queryParameters = {"region": "usa"};
    final res =
        await DioWrapper(baseUrl: 'https://coronavirus-map.p.rapidapi.com')
            .httpRequest(api);
    if (res.statusCode == 200) {
      int status = res.data['status'];
      if (status == 200) {
        covid19weekModel = Covid19WeekModel.fromJson(res.data);
        notifyListeners();
      } else {}
    } else {}
    return null;
  }

  Future<void> covid19NotifyGet() async {
    Covid19NotifyApi api = Covid19NotifyApi();
    api.heards = {
      "x-rapidapi-key": "15a5f98aa8msh562d9ee429d0004p124703jsnbd5dd202af0e",
      "x-rapidapi-host": "coronavirus-us-api.p.rapidapi.com"
    };
    api.queryParameters = {"source": "nyt"};
    final res =
        await DioWrapper(baseUrl: 'https://coronavirus-us-api.p.rapidapi.com')
            .httpRequest(api);
    if (res.statusCode == 200) {
      covid19notifyModel = Covid19NotifyModel.fromJson(res.data);
      covid19notifyModel.locations
          .sort((a, b) => b.latest.confirmed - a.latest.confirmed);
      notifyListeners();
    } else {}
    return null;
  }

  Future<void> covid19TotalGet() async {
    Covid19TotalApi api = Covid19TotalApi();
    api.heards = {
      "x-rapidapi-key": "15a5f98aa8msh562d9ee429d0004p124703jsnbd5dd202af0e",
      "x-rapidapi-host": "coronavirus-map.p.rapidapi.com"
    };
    api.queryParameters = {"region": "usa"};
    final res =
        await DioWrapper(baseUrl: 'https://coronavirus-map.p.rapidapi.com')
            .httpRequest(api);
    if (res.statusCode == 200) {
      int status = res.data['status'];
      if (status == 200) {
        covid19totalModel = Covid19TotalModel.fromJson(res.data);
        notifyListeners();
      } else {}
    } else {}
    return null;
  }

  Future<List<CountryCases>> fetchCountriesCovid19Cases() async {
    final res =
        await http.get('https://corona.lmao.ninja/v3/covid-19/countries');

    if (res.statusCode == 200) {
      return _parseCountryCases(res.body);
    } else {
      throw Exception('Failed to get data from API');
    }
  }

  List<CountryCases> _parseCountryCases(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<CountryCases>((json) => CountryCases.fromJson(json))
        .toList();
  }
}
