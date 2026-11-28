import 'package:flutter/material.dart';

import '../../../../res/app_theme/colors_util.dart';

class CartListViewContainerWidget extends StatelessWidget {
  final Widget child;
  const CartListViewContainerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorUtil.whiteColor[10],
        boxShadow: [
          BoxShadow(
            color: ColorUtil.whiteColor[16]!,
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}
