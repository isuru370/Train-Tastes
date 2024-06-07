import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final Function() onPressed;
  final String textName;
  const ForgotPasswordWidget(
      {super.key, required this.onPressed, required this.textName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onPressed,
            child: Text(
              textName,
            ),
          ),
        ],
      ),
    );
  }
}
