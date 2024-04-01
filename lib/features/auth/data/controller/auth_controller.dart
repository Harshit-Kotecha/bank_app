import 'package:bank_app/features/auth/data/models/sign_in_response.dart';
import 'package:bank_app/features/auth/data/services/auth_service.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:bank_app/utils/custom_print.dart';
import 'package:bank_app/utils/shared_pref.dart';
import 'package:bank_app/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';

class AuthController extends BaseController {
  final TextEditingController userNameTextController = TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController accountNoTextController = TextEditingController();

  final TextEditingController balanceTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  RxBool isLoading = RxBool(false);

  UserCredential? userCredential;

  @override
  onInit() {
    super.onInit();
    askNotificationPermission();
  }

  askNotificationPermission() async {
    try{
    PermissionStatus status = await Permission.notification.status;
    if (!status.isGranted) {
      await Permission.notification.request();
    }
    } catch(e){
      print("error while asking permission $e");
    }
  }

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
      // print(userCredential);
      isLoading.value = true;
      SignInResponse? response = await AuthService.signIn(
        email: userCredential?.user?.email,
        firstName: userCredential?.user?.displayName,
        lastName: "",
      );

      if (response != null) {
        await SharedPref.saveString(username, response.username ?? '');
        await SharedPref.saveString(firstName, response.firstName ?? '');
        await SharedPref.saveString(lastName, response.lastName ?? '');
        await SharedPref.saveString(kBalance, response.balance ?? '');
        await SharedPref.saveString(kAccountNo, response.accountNumber ?? '');
        await SharedPref.saveInt(userKey, response.id ?? 0);
        await SharedPref.saveString(ksortCode, response.sortCode ?? '');
        if (response.alreadyExist ?? false) {
          NavigationHandler.removeAllNavigateTo(NamedRoutes.dashboardScreen);
        } else {
          NavigationHandler.navigateTo(NamedRoutes.registerScreen);
        }
      } else {
        snackBar("Can not login Please Try after sometime.", isError: true);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // snackBar("Can not login Please Try after sometime.", isError: true);
      snackBar("$e", isError: true);

      printErr(e);
    }
  }

  Future<void> signIn() async {
    isLoading.value = true;
    await AuthService.signIn(
      email: userNameTextController.text,
    );
    isLoading.value = false;
  }

  logout() async {
    await SharedPref.clearAllData();
    await GoogleSignIn().signOut();
    NavigationHandler.offAllNamed(NamedRoutes.welcomeScreen);
  }

  Future<void> updateAccount({bool isRegister = false}) async {
    isLoading.value = true;

    await AuthService.updateAccount(
      userFirstName: firstNameTextController.text,
      userLastName: lastNameTextController.text,
      accountNo: accountNoTextController.text,
      balance: isRegister ? null : balanceTextController.text,
    );

    isLoading.value = false;

    firstNameTextController.clear();
    lastNameTextController.clear();
    accountNoTextController.clear();
    balanceTextController.clear();
  }
}
