import 'package:flutter/material.dart';
import 'colors_util.dart';

class ThemeTextUtil {
  static TextStyle headerTextNormalWhite = TextStyle(
    fontFamily: "Poppins",
    fontSize: 20,
    letterSpacing: 1,
    fontWeight: FontWeight.w800,
    color: ColorUtil.whiteColor[10],
  );
  static TextStyle headerTextNormalBlack = TextStyle(
    fontFamily: "Poppins",
    fontSize: 20,
    letterSpacing: 1,
    fontWeight: FontWeight.w800,
    color: ColorUtil.blackColor[10],
  );
  static TextStyle textfieldColor = TextStyle(color: ColorUtil.whiteColor[14]);
}
