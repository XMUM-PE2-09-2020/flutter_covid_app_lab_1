import 'package:dio/dio.dart';

enum HttpMethod { http_get, http_post, http_put, http_delete, http_patch }

enum HttpContentType { app_json, app_x_www_form_urlencoded, formData }

abstract class HttpBaseApi {
  ///data
  dynamic params = {};

  ///拼接到url后面的参数,只提供参数不需要带拼接符号？
  String urlParam;

  Map<String, dynamic> heards = {};

  Options options;

  ///queryParameters
  Map<String, dynamic> queryParameters = {};

  ///获取type

  HttpMethod method() => HttpMethod.http_post;

  ///获取路径

  String path();

  HttpContentType type() => HttpContentType.app_json;

  ///获取超时,单位为毫秒

  int timeout() => 60000;

  bool needToken() => true;

  String contentType(HttpContentType type) {
    switch (type) {
      case HttpContentType.app_json:
        return "application/json";
        break;
      case HttpContentType.app_x_www_form_urlencoded:
        return "application/x-www-form-urlencoded";
        break;
      case HttpContentType.formData:
        return "multipart/form-data";
        break;
      default:
        return "application/json";
        break;
    }
  }

  String httpType(HttpMethod type) {
    switch (type) {
      case HttpMethod.http_get:
        return "GET";
        break;
      case HttpMethod.http_post:
        return "POST";
        break;
      case HttpMethod.http_put:
        return "PUT";
        break;
      case HttpMethod.http_delete:
        return "DELETE";
        break;
      case HttpMethod.http_patch:
        return "PATCH";
        break;
      default:
        return "GET";
        break;
    }
  }
}
