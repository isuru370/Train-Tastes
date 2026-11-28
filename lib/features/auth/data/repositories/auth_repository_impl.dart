import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

/// Calls the data source and turns Firebase errors into friendly [Failure]s.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote);
  final AuthRemoteDataSource _remote;

  @override
  Stream<AppUser?> watchUser() => _remote.watchUser();

  @override
  Future<void> signInWithEmail({required String email, required String password}) =>
      _guard(() => _remote.signInWithEmail(email.trim(), password));

  @override
  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) =>
      _guard(() => _remote.signUpWithEmail(name.trim(), email.trim(), password));

  @override
  Future<void> signInWithGoogle() => _guard(_remote.signInWithGoogle);

  @override
  Future<void> sendPasswordReset(String email) =>
      _guard(() => _remote.sendPasswordReset(email.trim()));

  @override
  Future<void> signOut() => _guard(_remote.signOut);

  Future<T> _guard<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on Failure {
      rethrow;
    } on FirebaseAuthException catch (e) {
      throw Failure(_authMessage(e.code));
    } on GoogleSignInException {
      throw const Failure('Google sign in failed. Please try again.');
    } catch (_) {
      throw const Failure('Something went wrong. Please try again.');
    }
  }

  String _authMessage(String code) => switch (code) {
        'invalid-email' => 'That email address is not valid.',
        'user-disabled' => 'This account has been disabled.',
        'user-not-found' ||
        'wrong-password' ||
        'invalid-credential' =>
          'Email or password is incorrect.',
        'email-already-in-use' => 'An account already exists with this email.',
        'weak-password' => 'Password is too weak. Use at least 6 characters.',
        'account-exists-with-different-credential' =>
          'This email is already used with another sign-in method.',
        'too-many-requests' => 'Too many attempts. Please wait and try again.',
        'network-request-failed' => 'No internet connection.',
        _ => 'Authentication failed. Please try again.',
      };
}
