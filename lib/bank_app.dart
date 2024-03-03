import 'package:bank_app/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('en', 'UK'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      getPages: AppRoutes.screensRoutes(),
    );
  }
}
