import 'package:flutter/material.dart';

import '../../../../res/app_theme/colors_util.dart';


class HeaderProfileWidget extends StatelessWidget {
  final Function() onTap;
  final String profileImageUrl;
  final String profileName;
  final String profileStation;
  const HeaderProfileWidget(
      {super.key,
      required this.onTap,
      required this.profileImageUrl,
      required this.profileName,
      required this.profileStation});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(profileImageUrl),
          radius: 35,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileName,
              style: TextStyle(
                  fontSize: 16,
                  color: ColorUtil.blackColor[10],
                  fontWeight: FontWeight.w800),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onTap,
                  child: Text(
                    profileStation,
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorUtil.blackColor[16],
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            )
          ],
        ),
      ],
    );
  }
}
