import 'package:flutter/material.dart';

import '../../res/app_theme/colors_util.dart';


class OderButtonWidget extends StatelessWidget {
  final Function() orderTap;
  final String btnText;
  const OderButtonWidget(
      {super.key, required this.orderTap, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
        onTap: orderTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorUtil.whiteColor[10]),
          child: Text(
            btnText,
            style: TextStyle(
                color: ColorUtil.blueColor[18], fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
