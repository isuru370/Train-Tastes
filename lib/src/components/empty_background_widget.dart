import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/app_theme/colors_util.dart';

class EmptyBackgroundWidget extends StatelessWidget {
  final String svgImage, titleName, subTitleName;
  final Widget? child;
  const EmptyBackgroundWidget({
    super.key,
    required this.svgImage,
    required this.titleName,
    required this.subTitleName,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgImage,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              titleName,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: ColorUtil.tealColor[10],
                  letterSpacing: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            child: Text(
              subTitleName,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorUtil.tealColor[14]),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          child ?? const SizedBox()
        ],
      ),
    );
  }
}
