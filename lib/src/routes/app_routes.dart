import 'package:flutter/material.dart';
import 'package:train_tastes/src/modules/auth/arguments/form_data.dart';
import 'package:train_tastes/src/modules/auth/view/forgot_screen.dart';
import 'package:train_tastes/src/modules/auth/view/logged.dart';
import 'package:train_tastes/src/modules/auth/view/password_screen.dart';
import 'package:train_tastes/src/modules/intro/view/onboarding_screen.dart';
import 'package:train_tastes/src/modules/landing/bottom_navigation/view/bottom_nav_bar.dart';

import '../modules/main/cart/view/cart_screen.dart';
import '../modules/main/single_view_product/view/single_product_view_screen.dart';

class AppRoutes {
  static Route<dynamic> generatorRoutes(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoggedUser(),
        );
      case '/passwordScreen':
        final fromData = setting.arguments as FromData;
        return MaterialPageRoute(
          builder: (context) => PasswordScreen(
            email: fromData.email,
          ),
        );
      case '/forgotScreen':
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case '/introScreen':
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case '/landingScreen':
        return MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        );
      case '/singleProductViewScreen':
        return MaterialPageRoute(
          builder: (context) => const SingleProductViewScreen(),
        );
      case '/cartScreen':
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        );
    }
  }
}
