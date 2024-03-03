import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/app_strings.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextStyle {
  CustomTextStyle._();

  //POPPINS
  static TextStyle textStyle40SemiBold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 40),
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle24SemiBold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 24),
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle24Medium(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 24),
        fontWeight: FontWeight.w500,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle20Medium(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 20),
        fontWeight: FontWeight.w500,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );
  static TextStyle textStyle22RR(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 20),
        fontWeight: FontWeight.w300,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );
  static TextStyle textStyle20SemiBold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 20),
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle20Bold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 20),
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle18Bold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 20),
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle16Bold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 16),
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle16SemiBold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 16),
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle16Medium(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 16),
        fontWeight: FontWeight.w500,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle8Bold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 8),
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );
  static TextStyle textStyle16Regular(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 16),
        fontWeight: FontWeight.w400,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle14Bold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 14),
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle14SemiBold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 14),
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle14Medium(
    BuildContext context, {
    Color color = AppColors.black,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 14),
        fontWeight: FontWeight.w500,
        fontFamily: AppStrings.poppinsFont,
        color: color,
        letterSpacing: letterSpacing,
      );

  static TextStyle textStyle14R(
    BuildContext context, {
    Color color = AppColors.black,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 14),
        fontWeight: FontWeight.w400,
        fontFamily: AppStrings.poppinsFont,
        color: color,
        letterSpacing: letterSpacing,
      );

  static TextStyle textStyle13Bold(
    BuildContext context, {
    Color color = AppColors.black,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 13),
        fontWeight: FontWeight.w700,
        letterSpacing: letterSpacing ?? 0.2,
        color: color,
        fontFamily: AppStrings.poppinsFont,
      );
  static TextStyle textStyle12Bold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 12),
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle12SemiBold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 12),
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle12Medium(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 12),
        fontWeight: FontWeight.w500,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle12R(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 12),
        fontWeight: FontWeight.w400,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle10Bold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 10),
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );
  static TextStyle textStyle10Regular(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 10),
        fontWeight: FontWeight.w400,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );
  static TextStyle textStyle10SemiBold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 10),
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle8(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 8),
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle13(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 13),
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle11(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 11),
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );
  static TextStyle textStyle11Medium(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 11),
        fontWeight: FontWeight.w500,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );
  static TextStyle textStyle18SemiBold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 18),
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );

  static TextStyle textStyle34Bold(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleW(context, 34),
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.poppinsFont,
        color: color,
      );
}
