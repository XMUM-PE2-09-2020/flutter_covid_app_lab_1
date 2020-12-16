
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



