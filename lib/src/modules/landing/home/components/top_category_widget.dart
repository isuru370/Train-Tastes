import 'package:flutter/material.dart';

class TopCategoryWidget extends StatelessWidget {
  final Function() onTap;
  final String categoryImageUrl;
  final String categoryName;
  const TopCategoryWidget(
      {super.key,
      required this.onTap,
      required this.categoryImageUrl,
      required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: CircleAvatar(
              backgroundImage: AssetImage(categoryImageUrl),
              radius: 35,
            ),
          ),
          Text(categoryName),
        ],
      ),
    );
  }
}
