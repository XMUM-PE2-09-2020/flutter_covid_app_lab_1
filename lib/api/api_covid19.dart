import 'package:flutter_covid_app_lab_1/api/api_base.dart';

class Covid19WeekApi extends HttpBaseApi {
  @override
  String path() {
    return '/v1/spots/week';
  }

  @override
  HttpMethod method() {
    return HttpMethod.http_get;
  }
}

class Covid19TotalApi extends HttpBaseApi {
  @override
  String path() {
    return '/v1/summary/region';
  }

  @override
  HttpMethod method() {
    return HttpMethod.http_get;
  }
}

class Covid19NotifyApi extends HttpBaseApi {
  @override
  String path() {
    return '/api/state/all';
  }

  @override
  HttpMethod method() {
    return HttpMethod.http_get;
  }
}
