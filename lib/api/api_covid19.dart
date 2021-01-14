
import 'package:flutter_covid_app_lab_1/api/api_base.dart';

class Covid19WeekApi extends HttpBaseApi {
  @override
  String path() {
    return '/v1/spots/week';
  }

  @override
  HttpMethord methord() {
    return HttpMethord.http_get;
  }
}

class Covid19TotalApi extends HttpBaseApi {
  @override
  String path() {
    return '/v1/summary/region';
  }

  @override
  HttpMethord methord() {
    return HttpMethord.http_get;
  }
}

class Covid19NewsApi extends HttpBaseApi {
  @override
  String path() {
    return '/v1/states/info.json';
  }

  @override
  HttpMethord methord() {
    return HttpMethord.http_get;
  }
}

class Covid19NullApi extends HttpBaseApi {
  @override
  String path() {
    return '';
  }

  @override
  HttpMethord methord() {
    return HttpMethord.http_get;
  }
}



class Covid19NotifyApi extends HttpBaseApi {
  @override
  String path() {
    return '/api/state/all';
  }

  @override
  HttpMethord methord() {
    return HttpMethord.http_get;
  }
}



