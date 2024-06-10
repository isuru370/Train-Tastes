import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/app_theme/colors_util.dart';
import '../../../../res/image_path/images_utils.dart';
import '../components/background_widget.dart';
import '../components/list_title_widget.dart';
import '../components/profile_horiz_widget.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileBackgroundWidget(
                editProfileOnTap: () {},
                todayOderOnTap: () {},
                proMemberOnTap: () {},
                backgroundImageUrl: ImagesUtil.profileBg,
                profileImageUrl: ImagesUtil.userProfileImage,
                profileName: "Thilan Wijesinghe",
                profileEmail: "info@thilanwijesinghe.com",
                proMemberIcon: Iconsax.verify5,
                proMemberIconColor: ColorUtil.blueColor[18]!),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileHorizontalBarWidget(
                    onTap: () {},
                    color: ColorUtil.tealColor[10]!,
                    icon: Iconsax.shopping_cart5,
                    title: "Cart",
                    isVisibleBadge: false,
                  ),
                  ProfileHorizontalBarWidget(
                    onTap: () {},
                    color: ColorUtil.tealColor[10]!,
                    icon: Iconsax.receipt,
                    title: "Order list",
                    badgeValue: "2",
                    isVisibleBadge: true,
                  ),
                  ProfileHorizontalBarWidget(
                    onTap: () {},
                    color: ColorUtil.tealColor[10]!,
                    icon: Iconsax.dollar_circle,
                    title: "5,700 LKR",
                    isVisibleBadge: false,
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MORE TOOLS",
                          style: TextStyle(
                              color: ColorUtil.whiteColor[18],
                              letterSpacing: 2),
                        ),
                        ListTitleWidget(
                          onTab: () {},
                          title: "Membership",
                          leadingColor: ColorUtil.magentaColor[10]!,
                          leadingIcon: Iconsax.devices_14,
                        ),
                        ListTitleWidget(
                          onTab: () {},
                          title: "Favorite",
                          leadingColor: ColorUtil.orangeColor[22]!,
                          leadingIcon: Iconsax.folder_favorite5,
                        ),
                        ListTitleWidget(
                          onTab: () {},
                          title: "Add Friends",
                          leadingColor: ColorUtil.greenColor[10]!,
                          leadingIcon: Iconsax.profile_2user5,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SETTING",
                          style: TextStyle(
                              color: ColorUtil.whiteColor[18],
                              letterSpacing: 2),
                        ),
                        ListTitleWidget(
                          onTab: () {},
                          title: "Performance",
                          leadingColor: ColorUtil.orangeColor[10]!,
                          leadingIcon: Iconsax.cup5,
                        ),
                        ListTitleWidget(
                          onTab: () {},
                          title: "Availability",
                          leadingColor: ColorUtil.yellowColor[16]!,
                          leadingIcon: Iconsax.alarm5,
                        ),
                        ListTitleWidget(
                          onTab: () {},
                          title: "Info",
                          leadingColor: ColorUtil.skyBlueColor[10]!,
                          leadingIcon: Iconsax.info_circle5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
