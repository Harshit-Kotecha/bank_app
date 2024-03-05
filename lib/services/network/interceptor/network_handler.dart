import 'package:bank_app/constants/app_strings.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/utils/shared_pref.dart';
import 'package:bank_app/utils/snackbar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

mixin NetworkHandlingMixin {
  Future<void> handleErrorResponse(
    dio.DioException error,
    dio.ErrorInterceptorHandler handler,
  ) async {
    final int? statusCode = error.response?.statusCode;

    switch (statusCode) {
      case 400:
        snackBar(AppStrings.badRequest);
        return handler.next(error);
      case 401:
        await handleUnauthorized(error, handler);

      case 403:
        snackBar(AppStrings.forbidden);
        return handler.next(error);

      case 404:
        snackBar(AppStrings.pageNotFound);
        return handler.next(error);

      case 405:
        snackBar(AppStrings.methodNotAllowed);
        return handler.next(error);

      case 408:
        snackBar(AppStrings.requestTimeout);
        return handler.next(error);

      case 500:
        snackBar(AppStrings.internalServerError);
        return handler.next(error);

      case 502:
        snackBar(AppStrings.badGateway);
        return handler.next(error);

      case 503:
        snackBar(AppStrings.serviceUnavailable);
        return handler.next(error);

      case 504:
        snackBar(AppStrings.gatewayTimeout);
        return handler.next(error);

      default:
        // snackBar(AppStrings.somethingWentWrong);
        return handler.next(error);
    }
  }

  Future<void> handleUnauthorized(
    dio.DioException error,
    dio.ErrorInterceptorHandler handler,
  ) async {
    await SharedPref.clearAllData();
    NavigationHandler.offAllNamed(NamedRoutes.signinScreen);
    return handler.next(error);
  }

  void printResponse(dio.Response<dynamic> response) {
    if (kDebugMode) {
      print(
        "*************************************** Response *************************************** ",
      );

      // Print the response status code
      print('Status Code: ${response.statusCode}');

      // Print the response data
      print('Response Data: ${response.data}');
    }
  }

  void printRequest(dio.RequestOptions options) {
    if (kDebugMode) {
      print(
        "*************************************** Request *************************************** ",
      );

      // Print the request method (GET, POST, etc.)
      print('Request Method: ${options.method}');

      // Print the request URL
      print('Request URL: ${options.uri}');

      // Print the request data if it's available (e.g., for POST requests)
      if (options.data != null) {
        print('Request Data: ${options.data}');
      }
    }
  }
}
