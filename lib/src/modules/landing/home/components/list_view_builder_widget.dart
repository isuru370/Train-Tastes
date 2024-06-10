import 'package:flutter/material.dart';

class ListViewBuilderWidget extends StatelessWidget {
  final double height;
  final Axis scrollDirection;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  const ListViewBuilderWidget(
      {super.key,
      required this.height,
      required this.scrollDirection,
      required this.itemCount,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
          scrollDirection: scrollDirection,
          itemCount: itemCount,
          itemBuilder: itemBuilder),
    );
  }
}
