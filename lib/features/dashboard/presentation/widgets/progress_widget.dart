import 'package:bank_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.primaryColor,
    );
  }
}
