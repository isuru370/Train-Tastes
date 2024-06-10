import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<void> signInEmail(String email, String password);

  Future<MyUser> signInUpGoogle();

  Future<MyUser> signInUpFacebook();

  Future<void> logOut();

  Future<void> resetPassword(String email);

  Future<bool> setUser(MyUser myUser);

  Future<MyUser> getUser(String myUserId);
}
