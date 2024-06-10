import 'package:flutter/material.dart';
import 'package:train_tastes/src/modules/landing/home/view/home_main_screen.dart';
import 'package:train_tastes/src/routes/navigators.dart';

class HomeIndexScreen extends StatelessWidget {
  const HomeIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: homeNavigatorKey,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const HomeMainScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const HomeMainScreen(),
            );
        }
      },
    );
  }
}
