import 'dart:async';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/api/api_base.dart';

typedef InterceptorCallBak = dynamic Function(dynamic response);
typedef SendCallBak = Future<dynamic> Function(dynamic response);

///ms(毫秒)
const int Timeout = 60000;

const String BaseUrl = _baseUrl;

const String _baseUrl = '';

class DioWrapper {
  BuildContext context;
  Dio _dio = Dio();

  ///回调成功的拦截器
  InterceptorCallBak interceptorSuccess;

  ///回调失败的拦截器
  InterceptorCallBak interceptorError;

  ///网络请求的拦截器
  InterceptorCallBak interceptorSend;

  ///网络请求的拦截器(接受异步参数)
  SendCallBak interceptorSendAsync;

  String get baseUrl => _dio.options.baseUrl;

  set baseUrl(value) => _dio.options.baseUrl = value;

  DioWrapper({String baseUrl}) {
    _dio.options.baseUrl = baseUrl ?? _baseUrl;
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onSend, onResponse: _onSuccess, onError: _onError));
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.findProxy = (url) {
    //     ///设置代理 电脑ip地址
    //     return "PROXY 127.0.0.1:1087";

    //     ///不设置代理
    //     // return 'DIRECT';
    //   };

    //   ///忽略证书
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    // };
  }

  factory DioWrapper.hander(BuildContext context) =>
      _instance..context = context;
  static final _instance = DioWrapper._singleTon();
  DioWrapper._singleTon() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onSend, onResponse: _onSuccess, onError: _onError));
  }

  _onSend(RequestOptions options) async {
    if (interceptorSend != null) {
      options = interceptorSend(options) ?? options;
    }
    if (interceptorSendAsync != null) {
      options = (await interceptorSendAsync(options)) ?? options;
    }
    try {} catch (e) {}
    return options;
  }

  _onSuccess(Response response) {
    if (interceptorSuccess != null) {
      final res = interceptorSuccess(response);
      if (res is Response || res is DioError) {
        return res;
      }
    }
    return response;
  }

  _onError(DioError err) {
    if (err.response?.statusCode != null) {
      String message = err.message;
      if (message == null) {
        err.response.statusMessage = message;
        err.error = message;
      }
    } else {
      err.error = "未知错误";
    }
    if (interceptorError != null) {
      interceptorError(err);
    }
    if (err.response.statusCode == 401) {
      return err;
    }
    return err;
  }

  DioWrapper showHub() {
    return this;
  }

  Future<Response<T>> httpRequest<T>(
    HttpBaseApi api, {
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    (api.params as Map).removeWhere((key, value) => value == null);
    String path = api.path();
    _dio.options.connectTimeout = api.timeout();
    _dio.options.receiveTimeout = api.timeout();
    _dio.options.sendTimeout = api.timeout();

    api.heards = api.heards ?? {};
    _dio.options.headers.addAll(api.heards);
    final _httpMethod = api.method();
    _dio.options.queryParameters = api.queryParameters;
    _dio.options.method = api.httpType(_httpMethod);
    _dio.options.contentType = api.contentType(api.type());
    return _dio.request(path,
        data: _httpMethod == HttpMethod.http_get ? null : api.params,
        queryParameters: api.queryParameters,
        options: api.options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }
}
