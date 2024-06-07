import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String logoImageUrl;
  const LogoWidget({super.key, required this.logoImageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          logoImageUrl,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ),
      ],
    );
  }
}
