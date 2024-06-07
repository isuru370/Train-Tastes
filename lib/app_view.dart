import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_tastes/src/modules/auth/bloc/email_sign/email_sign_bloc.dart';
import 'package:train_tastes/src/modules/auth/bloc/social_media_sign/social_sign_bloc.dart';
import 'package:train_tastes/src/routes/app_routes.dart';

import 'src/modules/auth/bloc/google_sign/google_sign_bloc.dart';
import 'src/routes/navigators.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EmailSignBloc(),
        ),
        BlocProvider(
          create: (context) => GoogleSignBloc(),
        ),
        BlocProvider(
          create: (context) => FacebookSignBloc(),
        ),
      ],
      child: MaterialApp(
        key: globalNavigatorKey,
        debugShowCheckedModeBanner: false,
        title: "Train Tastes",
        initialRoute: "/",
        onGenerateRoute: AppRoutes.generatorRoutes,
      ),
    );
  }
}
