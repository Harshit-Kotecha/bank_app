import 'package:bank_app/features/auth/data/services/auth_service.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:bank_app/utils/custom_print.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends BaseController {
  final TextEditingController userNameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  RxBool isLoading = RxBool(false);

  UserCredential? userCredential;
  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      printWarning(userCredential);
      NavigationHandler.removeAllNavigateTo(NamedRoutes.dashboardScreen);
    } catch (e) {
      printErr(e);
    }
  }

  Future<void> signIn() async {
    isLoading.value = true;
    await AuthService.signIn(
      name: userNameTextController.text,
      password: passwordTextController.text,
    );
    isLoading.value = false;
  }
}
