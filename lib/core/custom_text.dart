import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    Key? key,
    required this.text,
    required this.textStyle,
    this.textAlign,
    this.maxLines = 1000,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: textStyle,
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines ?? 10,
      overflow: overflow,
      softWrap: true,
    );
  }
}
