import 'package:flutter/material.dart';
import 'package:base_package/vms/vm_base.dart';
import 'package:flutter_covid_app_lab_1/model/covid19_week_model.dart';
import 'package:provider/provider.dart';
import 'package:base_package/api/api_test.dart';
import 'package:base_package/http/http_handler.dart';
import 'package:flutter_covid_app_lab_1/api/api_covid19.dart';
class Covid19VM extends BaseVM {
  static Covid19VM of(BuildContext context, [bool listen = false]) =>
      (listen ? context.watch<Covid19VM>() : context.read<Covid19VM>())
        ..context = context;
  Covid19WeekModel covid19weekModel;
  Future<RequestResult> covid19WeedGet() async {
    Covid19WeekApi api = Covid19WeekApi();
    api.heards = {"x-rapidapi-key": "15a5f98aa8msh562d9ee429d0004p124703jsnbd5dd202af0e",
    "x-rapidapi-host": "coronavirus-map.p.rapidapi.com"};
    api.queryParameters = {"region": "usa"};
    final res = await DioWrapper(baseUrl: 'https://coronavirus-map.p.rapidapi.com')
        .showHub(show: false)
        .httpRequest(api);
    if (res.statusCode == 200) {
      int status = res.data['status'];
      if (status == 200) {
        //获取成功
        covid19weekModel = Covid19WeekModel.fromJson(res.data);
        notifyListeners();
      } else {
        
      }
    } else {
      
    }
    return RequestResult(result: res.data);
  }
}
