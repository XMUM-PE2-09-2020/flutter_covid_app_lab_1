import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:base_package/api/api_base.dart';
import 'package:base_package/uikit/loading_widget.dart';
// import 'package:base_package/utils/common.dart';
// import 'package:base_package/utils/utils.dart';
// import 'package:base_package/vms/vm_global.dart';
// import 'package:base_package/vms/vm_login.dart';
// import 'package:path_provider/path_provider.dart';
import 'http_error.dart';
// import 'package:base_package/utils/common.dart';
import 'package:dio/dio.dart';

typedef InterceptorCallBak = dynamic Function(dynamic response);
typedef SendCallBak = Future<dynamic> Function(dynamic response);

///ms(毫秒)
const int Timeout = 60000;

const String BaseUrl = _baseUrl;

// const String _baseUrl = 'https://api.jsrg.com.cn';
const String _baseUrl = 'https://test.api.jsrg.com.cn';

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
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    //   DioError error = new DioError();
    //   error.response = new Response();
    //   error.error = HttpError.infoWithMessage('600');
    //   error.response.statusMessage = HttpError.infoWithMessage('600');
    //   error.request = options;
    //   error.response.statusCode = 600;
    //   _onError(error);
    //   return _dio.reject(error);
    // }
    if (interceptorSend != null) {
      options = interceptorSend(options) ?? options;
    }
    if (interceptorSendAsync != null) {
      options = (await interceptorSendAsync(options)) ?? options;
    }
    try {
      // logger.d('请求url: ${options.baseUrl}${options.path}');
      // logger.d('请求参数:');
      // logger.d(options.data is FormData
      //     ? options.data.toString()
      //     : options.data is Map ? options.data : "");
      // logger.d("请求头: ");
      // logger.d(options.headers);
      // logger.d("queryParameters: ");
      // logger.d(options.queryParameters);
    } catch (e) {
      // logger.d('打印日志出错');
    }
    return options;
  }

  _onSuccess(Response response) {
    HXLoading().dismiss();
    // logger.d('返回数据: ${response?.data}');
    if (interceptorSuccess != null) {
      final res = interceptorSuccess(response);
      if (res is Response || res is DioError) {
        return res;
      }
    }
    return response;
  }

  _onError(DioError err) {
    HXLoading().dismiss();
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
      // LoginVM.loginOut();
      return err;
    }
    // logger.d('请求失败: $err');
    return err;
  }

  ///展示网络请求控件
  DioWrapper showHub({bool show = true}) {
    if (show) {
      HXLoading().show(type: LoadingType.loading);
    }
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
    // if (api.needToken() && GlobalVM().token != null) {
    //   final token = 'access_token=${GlobalVM().token}';
    //   path = path.contains('?') ? '$path&$token' : '$path?$token';
    // }
    _dio.options.connectTimeout = api.timeout();
    _dio.options.receiveTimeout = api.timeout();
    _dio.options.sendTimeout = api.timeout();

    api.heards = api.heards ?? {};
    _dio.options.headers.addAll(api.heards);
    final _httpMethod = api.methord();
    _dio.options.queryParameters = api.queryParameters;
    _dio.options.method = api.httpType(_httpMethod);
    _dio.options.contentType = api.contentType(api.type());
    return _dio.request(path,
        data: _httpMethod == HttpMethord.http_get ? null : api.params,
        queryParameters: api.queryParameters,
        options: api.options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }
}
