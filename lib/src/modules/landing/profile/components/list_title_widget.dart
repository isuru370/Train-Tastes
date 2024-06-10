import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/app_theme/colors_util.dart';


class ListTitleWidget extends StatelessWidget {
  final Function() onTab;
  final String title;
  final IconData leadingIcon;
  final Color leadingColor;
  const ListTitleWidget({
    super.key,
    required this.onTab,
    required this.title,
    required this.leadingColor,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        onTap: onTab,
        leading: Icon(
          leadingIcon,
          size: 35,
          color: leadingColor,
        ),
        title: Text(title),
        trailing: Icon(
          Iconsax.arrow_right_3,
          color: ColorUtil.tealColor[10]!,
        ),
      ),
    );
  }
}
