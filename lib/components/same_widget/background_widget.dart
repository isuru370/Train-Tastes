import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget? child;
  final String backgroundImageUrl;
  const BackgroundWidget(
      {super.key, this.child, required this.backgroundImageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 1.3,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImageUrl), fit: BoxFit.fill)),
        child: child);
  }
}
