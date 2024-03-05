import 'package:bank_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBar(String title, {String err = "", bool isError = false}) {
  final snackBar = SnackBar(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (err.isNotEmpty) ...{
          const SizedBox(height: 6),
          Text(
            err,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        },
      ],
    ),
    backgroundColor: isError ? AppColors.red : null,
    margin: const EdgeInsets.all(8),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
}
