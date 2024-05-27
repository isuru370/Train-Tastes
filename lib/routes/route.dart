import 'package:flutter/material.dart';
import 'package:train_tastes/screens/auth_screen/forgot_screen.dart';
import 'package:train_tastes/screens/auth_screen/login_screen.dart';
import 'package:train_tastes/screens/auth_screen/password_screen.dart';

import '../screens/intro_screen/onboarding_screen.dart';
import '../screens/landing_screen.dart';

Map<String, WidgetBuilder> route = {
  '/loginScreen': (context) => const LoginScreen(),
  '/passwordScreen': (context) => const PasswordScreen(),
  '/forgotPasswordScreen': (context) => const ForgotPasswordScreen(),
  '/introPage': (context) => const OnboardingScreen(),
  '/landingScreen': (context) => const LandingScreen(),
};
