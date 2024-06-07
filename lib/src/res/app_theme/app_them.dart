import 'package:flutter/material.dart';

import '../hex_color/hex_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: HexColor("#ffffff"),
    secondary: HexColor("#ffffff"),
  ),
  fontFamily: "Poppins",
);
ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: HexColor("#202231"),
    secondary: HexColor("#202231"),
  ),
  fontFamily: "Poppins",
);
