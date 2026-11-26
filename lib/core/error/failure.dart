/// An error the UI can show directly to the user.
class Failure implements Exception {
  const Failure(this.message);
  final String message;

  @override
  String toString() => message;
}

/// The user closed the Google sign-in sheet. Not an error, just ignore it.
class SignInCancelled extends Failure {
  const SignInCancelled() : super('Sign in cancelled');
}
