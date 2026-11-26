import 'package:equatable/equatable.dart';

enum UserRole {
  user,
  shop,
  admin;

  static UserRole fromString(String? value) => UserRole.values.firstWhere(
        (r) => r.name == value,
        orElse: () => UserRole.user,
      );
}

/// The logged-in person as the app sees them.
/// Pure Dart: no Firebase imports in the domain layer.
class AppUser extends Equatable {
  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.photoUrl,
  });

  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String? photoUrl;

  @override
  List<Object?> get props => [id, name, email, role, photoUrl];
}
