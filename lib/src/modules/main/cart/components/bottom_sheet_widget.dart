import 'package:flutter/material.dart';

import '../../../../components/app_heder_text_widget.dart';
import '../../../../res/app_theme/colors_util.dart';

class BottomSheetWidget extends StatelessWidget {
  final double? width, height, totalPrice;
  final int itemCount;
  final Widget? child;
  const BottomSheetWidget(
      {super.key,
      this.height,
      this.width,
      required this.itemCount,
      required this.totalPrice,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height / 4.2,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: ColorUtil.whiteColor[12],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppHeaderTextWidget(headerText: "Select Item"),
              AppHeaderTextWidget(headerText: "$itemCount"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Price",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: ColorUtil.tealColor[10],
                ),
              ),
              Text(
                "${totalPrice!.toStringAsFixed(2)} LKR",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: ColorUtil.tealColor[10],
                    letterSpacing: 1.5),
              ),
            ],
          ),
          child ?? const SizedBox(),
        ],
      ),
    );
  }
}
