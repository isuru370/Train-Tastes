import 'package:flutter/material.dart';

import '../res/app_theme/colors_util.dart';


class CardWidget extends StatelessWidget {
  final Widget child;
  final double? width, height;
  final Color color;
  final EdgeInsetsGeometry? padding;
  const CardWidget(
      {super.key,
      required this.child,
      this.padding,
      this.width,
      this.height,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
              blurRadius: 3,
              color: ColorUtil.whiteColor[16]!,
              offset: const Offset(1, 1))
        ],
      ),
      child: child,
    );
  }
}
