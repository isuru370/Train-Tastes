import 'package:flutter/material.dart';
import 'package:train_tastes/src/res/app_theme/colors_util.dart';

class MainBtnWidget extends StatelessWidget {
  final Function() onTap;
  final double width;
  final Color? btnBackgroundColor,textColor;
  final String buttonText;
  const MainBtnWidget(
      {super.key,
      required this.width,
      required this.btnBackgroundColor,
      required this.textColor,
      required this.buttonText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: btnBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 20,
              color: textColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
