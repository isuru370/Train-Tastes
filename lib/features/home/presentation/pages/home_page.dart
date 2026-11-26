import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/bloc/session_bloc.dart';

/// Placeholder home. Next step: separate screens for user / shop / admin.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SessionBloc>().state;
    if (state is! Authenticated) return const SizedBox.shrink();
    final user = state.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Train Tastes'),
        actions: [
          IconButton(
            tooltip: 'Sign out',
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<SessionBloc>().add(const SignOutRequested()),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hi ${user.name.isEmpty ? 'there' : user.name}!',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(user.email),
            const SizedBox(height: 8),
            Chip(label: Text('Role: ${user.role.name}')),
          ],
        ),
      ),
    );
  }
}
