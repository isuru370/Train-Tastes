import 'package:flutter/material.dart';
import 'package:train_tastes/themes/hex_color/hex_colors.dart';

class ColorUtil {
  static Map<int, Color> whiteColor = {
    10: HexColor("#FFFFFF"),
    12: HexColor("#E5E5E5"),
    14: HexColor("#CCCCCC"),
    16: HexColor("#B2B2B2"),
    18: HexColor("#999999"),
    20: HexColor("#7F7F7F"),
  };
  static Map<int, Color> blackColor = {
    10: HexColor("#000000"),
    12: HexColor("#1C1C1C"),
    14: HexColor("#383838"),
    16: HexColor("#555555"),
    18: HexColor("#717171"),
    20: HexColor("#8D8D8D"),
    22: HexColor("#AAAAAA"),
    24: HexColor("#C6C6C6")
  };
  static Map<int, Color> blueColor = {
    10: HexColor("#eaebfe"),
    12: HexColor("#b0b8ce"),
    14: HexColor("#505a74"),
    16: HexColor("#354c7c"),
    18: HexColor("#022954"),
  };
}
