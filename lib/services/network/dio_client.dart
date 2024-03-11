import 'package:bank_app/utils/shared_pref.dart';
import 'package:dio/dio.dart';
import 'interceptor/network_interceptor.dart';

class DioClient {
  DioClient._();

  static late Dio? _dioWithAuth;
  static Dio? get dioWithAuth {
    if (_dioWithAuth == null) {
      initWithAuth();
    }

    return _dioWithAuth;
  }

  static late Dio? _dioWithoutAuth;
  static Dio? get dioWithoutAuth {
    if (_dioWithoutAuth == null) {
      initWithoutAuth();
    }

    return _dioWithoutAuth;
  }

  static BaseOptions? _options;
  static BaseOptions? get options => _options;

  static void init() {
    // Init base options
    initBaseOption();

    // Init dio without auth
    initWithoutAuth();
  }

  static Future<void> initWithAuth() async {
    _dioWithAuth = createDio();
    _dioWithAuth!.options.headers = await getHeaders();
    _dioWithAuth!.interceptors.add(NetworkInterceptor());
  }

  static Future<void> initWithoutAuth() async {
    _dioWithoutAuth = createDio();
    // _dioWithoutAuth!.options.headers = await getHeadersWithoutToken();
    _dioWithoutAuth!.interceptors.add(NetworkInterceptor());
  }

  static Future<Map<String, String>> getHeaders({String? authToken}) async {
    String? token;
    if (authToken == null) {
      token = await SharedPref.getToken();
    }
    return {
      "Authorization": "Bearer ${authToken ?? token}",
    };
  }

  static Dio createDio({String? baseUrl}) {
    initBaseOption(baseUrl: baseUrl);
    final Dio dio = Dio(_options);
    return dio;
  }

  static void initBaseOption({String? baseUrl}) {
    _options = BaseOptions(
      baseUrl: "https://be52-49-36-238-84.ngrok-free.app/",
      connectTimeout: const Duration(milliseconds: 1000 * 120),
      receiveTimeout: const Duration(milliseconds: 12000),
      receiveDataWhenStatusError: true,
      contentType: Headers.jsonContentType,
    );
  }

  // static Future<Map<String, String>> getHeadersWithoutToken() async {
  //   final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   final String version = packageInfo.version;
  //   return {
  //     'os': (Platform.isAndroid) ? 'ANDROID' : 'IOS',
  //     'version': version,
  //   };
  // }
}
