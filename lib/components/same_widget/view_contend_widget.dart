import 'package:flutter/material.dart';

import '../../utils/colors_util.dart';
import '../../utils/theme_text.dart';

class PageViewContendWidget extends StatelessWidget {
  final String contendTitle;
  final String descriptionText;
  const PageViewContendWidget(
      {super.key, required this.contendTitle, required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            contendTitle,
            style: ThemeTextUtil.headerTextNormalWhite,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            descriptionText,
            style: TextStyle(fontSize: 15, color: ColorUtil.whiteColor[12]),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
