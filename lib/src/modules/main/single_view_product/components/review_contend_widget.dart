import 'package:flutter/material.dart';

import '../../../../res/app_theme/colors_util.dart';


class ReviewContendWidget extends StatelessWidget {
  final String userImageUrl, userName, dateTime, description;
  const ReviewContendWidget(
      {super.key,
      required this.userImageUrl,
      required this.userName,
      required this.dateTime,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 24, backgroundImage: AssetImage(userImageUrl)),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                        color: ColorUtil.blackColor[10], letterSpacing: 1),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    dateTime,
                    style: TextStyle(
                        fontSize: 10,
                        color: ColorUtil.blackColor[14],
                        letterSpacing: 1),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width / 1.3,
            child: Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
