import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'network_handler.dart';

class NetworkInterceptor extends Interceptor with NetworkHandlingMixin {
  @override
  dynamic onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (kDebugMode) printResponse(response);

    // Move ahead with the response
    handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) printRequest(options);
    // Move ahead with the request
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode && err.response != null) printResponse(err.response!);

    handleErrorResponse(err, handler);
  }
}
