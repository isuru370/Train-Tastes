import 'package:flutter/material.dart';

import '../res/app_theme/colors_util.dart';


class RoundContainerWidget extends StatelessWidget {
  final Function() onTap;
  final double width, height;
  final String text;
  const RoundContainerWidget(
      {super.key,
      required this.onTap,
      required this.width,
      required this.height,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: ColorUtil.tealColor[10]!),
          boxShadow: [
            BoxShadow(
              color: ColorUtil.whiteColor[10]!,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: ColorUtil.blackColor[10],
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
