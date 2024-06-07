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

  //product view text style

  static TextStyle productName = TextStyle(
      fontFamily: "Poppins",
      color: ColorUtil.whiteColor[10],
      fontSize: 15,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5);

  static TextStyle productPrice = TextStyle(
      fontFamily: "Poppins", fontSize: 12, color: ColorUtil.whiteColor[14]);

  static TextStyle productSold = TextStyle(
      fontFamily: "Poppins", fontSize: 12, color: ColorUtil.whiteColor[16]);
}
