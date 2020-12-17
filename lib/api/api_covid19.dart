
import 'package:base_package/api/api_base.dart';

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



