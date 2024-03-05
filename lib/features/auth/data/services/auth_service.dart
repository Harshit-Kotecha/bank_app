import 'package:bank_app/services/network/dio_client.dart';

abstract class AuthService {
  static Future<void> signIn({String? username, String? password}) async {
    final json =
        await DioClient.dioWithoutAuth?.post("/bank/user/login", data: {
      "username": username,
      "password": password,
    });
  }
}
