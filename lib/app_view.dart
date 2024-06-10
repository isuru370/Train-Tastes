import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_tastes/src/blocs/theme_bloc/theme_bloc.dart';
import 'package:train_tastes/src/modules/auth/bloc/email_sign/email_sign_bloc.dart';
import 'package:train_tastes/src/modules/auth/bloc/social_media_sign/social_sign_bloc.dart';
import 'package:train_tastes/src/modules/main/single_view_product/bloc/quantity_update/quantity_cubit.dart';
import 'package:train_tastes/src/modules/main/single_view_product/bloc/toggle_button/toggle_button_cubit.dart';
import 'package:train_tastes/src/res/app_theme/app_them.dart';
import 'package:train_tastes/src/routes/app_routes.dart';

import 'src/modules/landing/bottom_navigation/block/bottom_navigation_cubit/navigation_cubit.dart';
import 'src/modules/main/single_view_product/bloc/indicator/indicator_cubit.dart';
import 'src/routes/navigators.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => EmailSignBloc(),
        ),
        BlocProvider(
          create: (context) => SocialSignBloc(),
        ),
        BlocProvider(
          create: (_) => NavigationCubit(),
        ),
        BlocProvider(
          create: (_) => QuantityCubit(),
        ),
        BlocProvider(
          create: (_) => ToggleButtonCubit(),
        ),
        BlocProvider(
          create: (_) => DotIndicatorCubit(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            key: globalNavigatorKey,
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            themeMode: state,
            darkTheme: darkMode,
            title: "Train Tastes",
            initialRoute: "/",
            onGenerateRoute: AppRoutes.generatorRoutes,
          );
        },
      ),
    );
  }
}
