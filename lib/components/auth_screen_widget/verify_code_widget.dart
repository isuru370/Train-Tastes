import 'package:flutter/material.dart';
import 'package:train_tastes/utils/theme_text.dart';
import '../../utils/colors_util.dart';

class VerifyCodeWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final Color enabledBorderColor, activeBorderColors;
  final bool obscureText;
  final Function(String) onChanged;
  final Function()? onTap;
  const VerifyCodeWidget({
    super.key,
    required this.onChanged,
    required this.onTap,
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
        onChanged: onChanged,
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
            suffixIcon: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Send code",
                  style: TextStyle(
                      color: ColorUtil.whiteColor[14],
                      fontSize: 14,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxHeight: double.infinity),
            hintStyle:
                TextStyle(fontSize: 14, color: ColorUtil.whiteColor[12])),
        keyboardType: keyboardType,
        style: ThemeTextUtil.textfieldColor,
      ),
    );
  }
}
