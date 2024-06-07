import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<void> signInEmail(String email, String password);

  Future<bool> signInUpGoogle();

  Future<bool> signInUpFacebook();

  Future<void> logOut();

  Future<void> resetPassword(String email);

  Future<void> setUser(MyUser myUser);

  Future<MyUser> getUser(String myUserId);
}
