import 'package:bank_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

abstract class Spacing {
  static Widget verticalSpacing(context, double height) {
    return SizedBox(height: scaleH(context, height));
  }

  static Widget horizontalSpacing(context, double width) {
    return SizedBox(width: scaleW(context, width));
  }
}
