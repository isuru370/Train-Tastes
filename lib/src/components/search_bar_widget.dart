import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../res/app_theme/colors_util.dart';
import '../res/app_theme/theme_text.dart';


class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  const SearchBarWidget({super.key,
  required this.onChanged,
  required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: null,
      onChanged: onChanged,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorUtil.tealColor[10]!)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtil.tealColor[20]!),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hintText,
          prefixIcon: const Icon(Iconsax.search_normal_1),
          hintStyle: TextStyle(fontSize: 14, color: ColorUtil.blackColor[12])),
      keyboardType: TextInputType.text,
      style: ThemeTextUtil.textfieldColor,
    );
  }
}
