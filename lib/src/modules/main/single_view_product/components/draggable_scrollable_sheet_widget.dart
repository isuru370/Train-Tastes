import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';

import '../../../../res/app_theme/colors_util.dart';


class DraggableScrollableSheetWidget extends StatelessWidget {
  final Widget child;
  const DraggableScrollableSheetWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(20)),
        color: ColorUtil.whiteColor[10],
      ),
      child: child,
    );
  }
}

class DecorationWidget extends StatelessWidget {
  const DecorationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5,
          width: 35,
          color: ColorUtil.blackColor[20],
        ),
      ],
    );
  }
}

class ShopNameWidget extends StatelessWidget {
  final String shopNameText;
  const ShopNameWidget({super.key, required this.shopNameText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          shopNameText,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              letterSpacing: 0.7,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class HeaderNameWidget extends StatelessWidget {
  final String productName;
  final double rate;
  final String ratingNo;
  const HeaderNameWidget(
      {super.key,
      required this.productName,
      required this.rate,
      required this.ratingNo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          productName,
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 24,
              color: ColorUtil.tealColor[10],
              fontWeight: FontWeight.w800,
              letterSpacing: 1),
        ),
        Row(
          children: [
            PannableRatingBar(
              rate: rate,
              items: List.generate(
                  5,
                  (index) => RatingWidget(
                        selectedColor: ColorUtil.yellowColor[10]!,
                        unSelectedColor: ColorUtil.blackColor[16],
                        child: const Icon(
                          Icons.star,
                          size: 20,
                        ),
                      )),
              onChanged: (value) {
                // the rating value is updated on tap or drag.
              },
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              ratingNo,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TextBarWidget extends StatelessWidget {
  final String textBarName;
  final Color color;
  const TextBarWidget(
      {super.key, required this.textBarName, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        textBarName,
        style: TextStyle(
            color: ColorUtil.whiteColor[10],
            fontWeight: FontWeight.w400,
            letterSpacing: 0.7),
      ),
    );
  }
}
