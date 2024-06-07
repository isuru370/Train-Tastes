import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_tastes/src/modules/auth/view/login_screen.dart';

import '../../../blocs/authentication_bloc/authentication_bloc_bloc.dart';
import '../../../home_screen.dart';

class LoggedUser extends StatelessWidget {
  const LoggedUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
