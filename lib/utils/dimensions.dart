import 'package:flutter/material.dart';

class Dimensions {
  BuildContext context;

  Dimensions({required this.context});

  double get screenHeight {
    return MediaQuery.of(context).size.height;
  }

  double get screenWidth {
    return MediaQuery.of(context).size.width;
  }
}

double scaleH(context, double value) {
  return value * ((Dimensions(context: context).screenHeight) / 640);
}

double scaleWidthPercentage(double? percent, BuildContext context) {
  return MediaQuery.of(context).size.width * (percent ?? 1);
}

double scaleHeightPercentage(double? percent, BuildContext context) {
  return MediaQuery.of(context).size.height * (percent ?? 1);
}

double scaleW(context, double value) {
  return value * ((Dimensions(context: context).screenWidth) / 360);
}

double getFontSize(BuildContext ctx, double value) {
  return MediaQuery.of(ctx).size.width / 360 * value;
}
