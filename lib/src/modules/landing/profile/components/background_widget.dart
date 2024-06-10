import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/app_theme/colors_util.dart';


class ProfileBackgroundWidget extends StatelessWidget {
  final Function() editProfileOnTap, todayOderOnTap, proMemberOnTap;
  final String backgroundImageUrl, profileImageUrl, profileName, profileEmail;
  final IconData proMemberIcon;
  final Color proMemberIconColor;

  const ProfileBackgroundWidget(
      {super.key,
      required this.editProfileOnTap,
      required this.todayOderOnTap,
      required this.proMemberOnTap,
      required this.backgroundImageUrl,
      required this.profileImageUrl,
      required this.profileName,
      required this.profileEmail,
      required this.proMemberIcon,
      required this.proMemberIconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        height: 230,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImageUrl), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(profileImageUrl),
                    radius: 40,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          profileName,
                          style: TextStyle(
                              fontSize: 18, color: ColorUtil.whiteColor[10]),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          profileEmail,
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorUtil.whiteColor[14],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: editProfileOnTap,
                          child: Row(
                            children: [
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorUtil.whiteColor[10]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Iconsax.arrow_right_3,
                                color: ColorUtil.whiteColor[14],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 1,
                color: ColorUtil.whiteColor[16],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: proMemberOnTap,
                      child: Row(
                        children: [
                          Icon(
                            proMemberIcon,
                            size: 18,
                            color: proMemberIconColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Pro Member",
                            style: TextStyle(color: ColorUtil.whiteColor[10]),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: todayOderOnTap,
                      child: Row(
                        children: [
                          Text(
                            "Today Oder",
                            style: TextStyle(color: ColorUtil.whiteColor[14]),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                            color: ColorUtil.whiteColor[14],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
