import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../res/app_theme/colors_util.dart';
import '../res/app_theme/theme_text.dart';


class ProductViewWidget extends StatelessWidget {
  final Function() onTap, favoriteOnTap;
  final String productImageUrl;
  final String productName;
  final String productPrice;
  final String productSold;
  final String productDiscount;
  final Widget child;
  final String stationName;
  final IconData icon;
  const ProductViewWidget({
    super.key,
    required this.onTap,
    required this.favoriteOnTap,
    required this.productImageUrl,
    required this.productName,
    required this.productPrice,
    required this.productSold,
    required this.productDiscount,
    required this.child,
    required this.stationName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorUtil.tealColor[12],
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  color: ColorUtil.whiteColor[18]!,
                  offset: const Offset(1, 1))
            ]),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: Image.asset(
                        productImageUrl,
                        fit: BoxFit.cover,
                        height: 173,
                      )),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: InkWell(
                        onTap: favoriteOnTap,
                        child: Icon(
                          Iconsax.heart,
                          color: ColorUtil.tealColor[10],
                        ),
                      )),
                  Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: ColorUtil.tealColor[10],
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "$productDiscount%",
                          style: TextStyle(color: ColorUtil.whiteColor[10]),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorUtil.blackColor[10],
                          radius: 14,
                          child: Icon(
                            icon,
                            size: 20,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            stationName,
                            style: TextStyle(
                                fontSize: 13,
                                color: ColorUtil.whiteColor[10],
                                letterSpacing: 1),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: ColorUtil.whiteColor[16],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productName,
                          style: ThemeTextUtil.productName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          productPrice,
                          style: ThemeTextUtil.productPrice,
                        )
                      ],
                    ),
                    Expanded(
                      child: Text(
                        "$productSold sold Today",
                        style: ThemeTextUtil.productSold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    child,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
