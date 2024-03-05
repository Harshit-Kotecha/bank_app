import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final bool? hasPrefixSearchIcon;
  final String underlineText;
  final String? suffixText;
  final bool? hasSuffixIcon;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.hasPrefixSearchIcon,
    this.underlineText = "",
    this.suffixText,
    this.hasSuffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? error;
  int? maxLength;
  bool _obscureText = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          onTap: () {
            setState(() {
              error = null;
            });
            widget.onTap?.call();
          },
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          showCursor: true,
          maxLength: maxLength,
          cursorColor: AppColors.neutrals_500,
          style: TextStyle(
            color: AppColors.neutrals_800,
            fontSize: scaleW(context, 14),
          ),
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          decoration: InputDecoration(
            suffixIcon: (widget.hasSuffixIcon == true)
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : const SizedBox.shrink(),
            labelText: widget.labelText,
            hintText: widget.hintText,
            counterText: "",
            suffixText: widget.suffixText,
            suffixStyle: TextStyle(
              color: AppColors.neutrals_800,
              fontSize: scaleW(context, 14),
            ),
            errorText: error,
            labelStyle: TextStyle(color: AppColors.neutrals_500),
            fillColor: AppColors.neutralsWhite,
            filled: true,
            hintStyle: const TextStyle(color: AppColors.f969696),
            contentPadding: const EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.neutrals_200),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.neutrals_500),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.fD40808),
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: widget.hasPrefixSearchIcon != null &&
                    widget.hasPrefixSearchIcon!
                ? const Icon(Icons.search, color: AppColors.f969696)
                : null,
          ),
        ),
        if (widget.underlineText.isNotEmpty) ...{
          Spacing.verticalSpacing(context, 3),
          CustomText(
            text: widget.underlineText,
            textStyle: CustomTextStyle.textStyle14R(
              context,
              color: AppColors.neutrals_400,
            ),
          )
        },
      ],
    );
  }
}
