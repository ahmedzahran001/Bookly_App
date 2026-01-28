import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('''
┌──────────────────────────────────────
│ 🚀 REQUEST
│ URL: ${options.uri}
│ METHOD: ${options.method}
│ HEADERS: ${options.headers}
│ QUERY: ${options.queryParameters}
│ BODY: ${options.data}
└──────────────────────────────────────
''');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('''
┌──────────────────────────────────────
│ ✅ RESPONSE
│ URL: ${response.requestOptions.uri}
│ STATUS: ${response.statusCode}
│ DATA: ${response.data}
└──────────────────────────────────────
''');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('''
┌──────────────────────────────────────
│ ❌ ERROR
│ URL: ${err.requestOptions.uri}
│ STATUS: ${err.response?.statusCode}
│ MESSAGE: ${err.message}
│ DATA: ${err.response?.data}
└──────────────────────────────────────
''');

    super.onError(err, handler);
  }
}
