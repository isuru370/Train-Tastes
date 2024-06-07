import 'package:flutter/material.dart';

import '../res/app_theme/theme_text.dart';

class AppHeaderTextWidget extends StatelessWidget {
  final String headerText;
  const AppHeaderTextWidget({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      style: ThemeTextUtil.headerTextNormalBlack,
    );
  }
}
