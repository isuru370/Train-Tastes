import 'package:flutter/material.dart';

import '../res/app_theme/colors_util.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  final Function()? onTap;
  const PrivacyPolicyWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: InkWell(
        onTap: onTap,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "Your privacy will be protected, please refer our ",
              style: TextStyle(color: ColorUtil.blackColor[10], fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                    text: "Privacy Policy.",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: ColorUtil.blueColor[16]))
              ]),
        ),
      ),
    );
  }
}
