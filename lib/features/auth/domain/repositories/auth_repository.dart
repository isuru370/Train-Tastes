import '../entities/app_user.dart';

/// What the app needs from authentication.
/// The UI depends on this interface only, never on Firebase directly.
/// All methods throw [Failure] with a message that is safe to show.
abstract interface class AuthRepository {
  /// Emits the current user, or null when logged out.
  Stream<AppUser?> watchUser();

  Future<void> signInWithEmail({required String email, required String password});

  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  /// Works for both sign in and sign up. Throws [SignInCancelled] if closed.
  Future<void> signInWithGoogle();

  Future<void> sendPasswordReset(String email);

  Future<void> signOut();
}
