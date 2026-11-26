import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/di/injection.dart';
import '../core/theme/app_theme.dart';
import '../features/auth/presentation/bloc/session_bloc.dart';
import 'router.dart';

class TrainTastesApp extends StatefulWidget {
  const TrainTastesApp({super.key});

  @override
  State<TrainTastesApp> createState() => _TrainTastesAppState();
}

class _TrainTastesAppState extends State<TrainTastesApp> {
  late final SessionBloc _session = sl<SessionBloc>()..add(const SessionStarted());
  late final GoRouter _router = createRouter(_session);

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _session,
      child: MaterialApp.router(
        title: 'Train Tastes',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: _router,
      ),
    );
  }
}
