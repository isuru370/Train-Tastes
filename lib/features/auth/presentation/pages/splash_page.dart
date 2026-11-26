import 'package:flutter/material.dart';

/// Shown for a moment while the app checks if someone is logged in.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo/logo_icon.png',
          width: 140,
          errorBuilder: (_, __, ___) => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
