import 'package:bank_app/features/dashboard/data/controller/home_controller.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/my_app_bar.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/custom_text_field.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Dimensions(context: context).screenHeight - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  MyAppBar(text: "My Account"),
                  Spacing.verticalSpacing(context, 32),
                  CustomTextField(
                    labelText: "Your name:",
                    controller:
                        TextEditingController(text: homeController.name.value),
                    readOnly: true,
                  ),
                  Spacing.verticalSpacing(context, 24),
                  CustomTextField(
                    labelText: "Your ID:",
                    controller: TextEditingController(
                        text: homeController.userId.toString()),
                    readOnly: true,
                  ),
                  Spacing.verticalSpacing(context, 24),
                ],
              ),
              // Column(
              //   // mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     AppElevatedButton(
              //       title: "Send Money",
              //       onPress: () {
              //         NavigationHandler.navigateTo(NamedRoutes.receiptScreen);
              //       },
              //     ),
              //     const CardWidget(),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
