import 'package:flutter/material.dart';

import '../res/app_theme/colors_util.dart';
import '../res/app_theme/theme_text.dart';

class InputFelidWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final Color enabledBorderColor, activeBorderColors;
  final bool obscureText;
  const InputFelidWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    required this.enabledBorderColor,
    required this.activeBorderColors,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: enabledBorderColor)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: activeBorderColors),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
            hintStyle:
                TextStyle(fontSize: 14, color: ColorUtil.whiteColor[12])),
        keyboardType: keyboardType,
        style: ThemeTextUtil.textfieldColor,
      ),
    );
  }
}
