import 'dart:async';

import 'package:train_tastes/core/error/failure.dart';
import 'package:train_tastes/features/auth/domain/entities/app_user.dart';
import 'package:train_tastes/features/auth/domain/repositories/auth_repository.dart';

/// A hand-written fake so tests never touch real Firebase.
/// Set [error] to make the next call fail with that error.
class FakeAuthRepository implements AuthRepository {
  final userController = StreamController<AppUser?>.broadcast();

  Object? error;
  final calls = <String>[];

  Future<void> _call(String name) async {
    calls.add(name);
    final e = error;
    if (e != null) throw e;
  }

  @override
  Stream<AppUser?> watchUser() => userController.stream;

  @override
  Future<void> signInWithEmail({required String email, required String password}) =>
      _call('signInWithEmail:$email');

  @override
  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) =>
      _call('signUpWithEmail:$name:$email');

  @override
  Future<void> signInWithGoogle() => _call('signInWithGoogle');

  @override
  Future<void> sendPasswordReset(String email) => _call('sendPasswordReset:$email');

  @override
  Future<void> signOut() => _call('signOut');

  void dispose() => userController.close();
}

const testUser = AppUser(
  id: 'u1',
  name: 'Kasun',
  email: 'kasun@example.com',
  role: UserRole.user,
);

const wrongPassword = Failure('Email or password is incorrect.');
