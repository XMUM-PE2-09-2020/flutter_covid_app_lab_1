import 'api_base.dart';

class TestApi extends HttpBaseApi {
  @override
  String path() {
    return '/test';
  }

  @override
  HttpMethord methord() {
    return HttpMethord.http_post;
  }
}

