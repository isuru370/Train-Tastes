import 'package:flutter/material.dart';
import 'package:train_tastes/src/home_screen.dart';
import 'package:train_tastes/src/modules/auth/arguments/form_data.dart';
import 'package:train_tastes/src/modules/auth/view/forgot_screen.dart';
import 'package:train_tastes/src/modules/auth/view/logged.dart';
import 'package:train_tastes/src/modules/auth/view/password_screen.dart';
import 'package:train_tastes/src/modules/intro/view/onboarding_screen.dart';

class AppRoutes {
  static Route<dynamic> generatorRoutes(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoggedUser(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/passwordScreen':
        final fromData = setting.arguments as FromData;
        return MaterialPageRoute(
          builder: (context) =>  PasswordScreen(
            email: "${fromData.email}",
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
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
