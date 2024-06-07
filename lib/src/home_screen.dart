import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_tastes/src/modules/auth/bloc/email_sign/email_sign_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = BlocProvider.of<EmailSignBloc>(context);
    return Scaffold(
      body: Center(
        child: BlocBuilder<EmailSignBloc, EmailSignState>(
            builder: (context, state) {
          if (state is EmailSignOutProcess) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ElevatedButton(
              onPressed: () {
                authProvider.add(const EmailSignOutEvent());
              },
              child: const Text("Log out"));
        }),
      ),
    );
  }
}
