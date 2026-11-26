import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../../domain/entities/app_user.dart';

/// Converts between Firestore documents and the [AppUser] entity.
class AppUserModel {
  AppUserModel._();

  static AppUser fromFirestore(
    Map<String, dynamic> data,
    fb.User firebaseUser,
  ) {
    final storedName = (data['name'] as String?)?.trim() ?? '';
    return AppUser(
      id: firebaseUser.uid,
      name: storedName.isNotEmpty ? storedName : (firebaseUser.displayName ?? ''),
      email: data['email'] as String? ?? firebaseUser.email ?? '',
      role: UserRole.fromString(data['role'] as String?),
      photoUrl: data['photoUrl'] as String? ?? firebaseUser.photoURL,
    );
  }

  /// Fields written when a new account is created.
  /// Role is always "user" here; security rules block anything else.
  static Map<String, dynamic> newUserDocument(fb.User user, {String? name}) => {
        'name': name ?? user.displayName ?? '',
        'email': user.email ?? '',
        'photoUrl': user.photoURL,
        'role': UserRole.user.name,
        'createdAt': FieldValue.serverTimestamp(),
      };
}
