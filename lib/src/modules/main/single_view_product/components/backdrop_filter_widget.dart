import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../res/app_theme/colors_util.dart';


class BackdropFilterWidget extends StatelessWidget {
  final IconData icon;
  final double size;
  const BackdropFilterWidget(
      {super.key, required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            icon,
            size: size,
            color: ColorUtil.tealColor[10],
          ),
        ),
      ),
    );
  }
}
