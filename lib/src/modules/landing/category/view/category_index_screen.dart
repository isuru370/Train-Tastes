import 'package:flutter/material.dart';
import 'package:train_tastes/src/modules/landing/category/view/category_main_screen.dart';
import 'package:train_tastes/src/routes/navigators.dart';

class CategoryIndexScreen extends StatelessWidget {
  const CategoryIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: categoryNavigatorKey,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const CategoryMainScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const CategoryMainScreen(),
            );
        }
      },
    );
  }
}
