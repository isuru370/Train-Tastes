import 'package:flutter/material.dart';
import 'package:train_tastes/themes/hex_color/hex_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: HexColor("#ffffff"),
    primary: HexColor("#ffffff"),
    secondary: HexColor("#ffffff"),
  ),
  fontFamily: "Poppins",
);
ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: HexColor("#202231"),
    primary: HexColor("#202231"),
    secondary: HexColor("#202231"),
  ),
  fontFamily: "Poppins",
);
