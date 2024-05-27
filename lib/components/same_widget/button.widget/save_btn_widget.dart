import 'package:flutter/material.dart';

class SaveButtonWidget extends StatelessWidget {
  final Function() onTap;
  final double width;
  final Color? btnBackgroundColor;
  final String buttonText;
  const SaveButtonWidget(
      {super.key,
      required this.width,
      required this.btnBackgroundColor,
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
              color: const Color.fromARGB(255, 7, 45, 102),
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
