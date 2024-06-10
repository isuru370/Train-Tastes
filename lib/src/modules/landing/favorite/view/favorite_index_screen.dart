import 'package:flutter/material.dart';
import 'package:train_tastes/src/modules/landing/favorite/view/favorite_main_screen.dart';
import 'package:train_tastes/src/routes/navigators.dart';

class FavoriteIndexScreen extends StatelessWidget {
  const FavoriteIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: favoriteNavigatorKey,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const FavoriteMainScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const FavoriteMainScreen(),
            );
        }
      },
    );
  }
}
