import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_tastes/app_view.dart';
import 'package:train_tastes/src/blocs/authentication_bloc/authentication_bloc_bloc.dart';
import 'package:user_repository/user_repository.dart';

class TrainTastes extends StatelessWidget {
  final UserRepository userRepository;
  const TrainTastes(this.userRepository, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
          create: (_) => AuthenticationBloc(myUserRepository: userRepository))
    ], child: const MyAppView());
  }
}
