import 'package:flutter/material.dart';
import 'package:train_tastes/src/modules/landing/profile/view/profile_main_screen.dart';
import 'package:train_tastes/src/routes/navigators.dart';

class ProfileIndexScreen extends StatelessWidget {
  const ProfileIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: profileNavigatorKey,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const ProfileMainScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const ProfileMainScreen(),
            );
        }
      },
    );
  }
}
