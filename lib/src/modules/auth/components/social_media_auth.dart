import 'package:flutter/material.dart';

import '../../../res/app_theme/colors_util.dart';


class SocialMediaAuthWidget extends StatelessWidget {
  final Function() onTap;
  final String socialImageUrl;
  const SocialMediaAuthWidget({super.key, required this.socialImageUrl,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: ColorUtil.whiteColor[10]!,
            border: Border.all(color: ColorUtil.whiteColor[10]!, width: 3.0),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: ColorUtil.blackColor[10]!,
                  offset: const Offset(1, 3))
            ]),
        child: Image.asset(socialImageUrl),
      ),
    );
  }
}
