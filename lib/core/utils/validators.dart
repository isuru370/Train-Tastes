class Validators {
  Validators._();

  static final _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  static String? name(String? value) {
    if (value == null || value.trim().length < 2) return 'Enter your name';
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter your email';
    if (!_emailRegex.hasMatch(value.trim())) return 'Enter a valid email';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Enter your password';
    if (value.length < 6) return 'At least 6 characters';
    return null;
  }
}
