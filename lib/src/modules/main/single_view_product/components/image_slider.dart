import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderWidget extends StatelessWidget {
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  final List<Widget>? items;
  const ImageSliderWidget({super.key,
  required this.onPageChanged,
  required this.items});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 2,
        viewportFraction: 1,
        onPageChanged: onPageChanged,
      ),
      items: items,
    );
  }
}
