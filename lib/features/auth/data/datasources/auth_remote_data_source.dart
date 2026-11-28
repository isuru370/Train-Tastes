import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/app_user.dart';
import '../models/app_user_model.dart';

/// The only place that talks to Firebase Auth, Google and the users collection.
class AuthRemoteDataSource {
  AuthRemoteDataSource({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _google = googleSignIn;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _google;

  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection('users');

  Stream<AppUser?> watchUser() {
    return _auth.userChanges().asyncMap((user) async {
      if (user == null) return null;
      final data = await _ensureUserDocument(user);
      return AppUserModel.fromFirestore(data, user);
    });
  }

  Future<void> signInWithEmail(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmail(String name, String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = cred.user!;
    // The session listener may have already created the doc (without a name),
    // so create-if-missing first, then set the name.
    await _ensureUserDocument(user, name: name);
    await _users.doc(user.uid).update({'name': name});
    await user.updateDisplayName(name); // triggers a fresh session update
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount account;
    try {
      account = await _google.authenticate();
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw const SignInCancelled();
      }
      rethrow;
    }

    final idToken = account.authentication.idToken;
    final credential = GoogleAuthProvider.credential(idToken: idToken);
    final result = await _auth.signInWithCredential(credential);
    await _ensureUserDocument(result.user!);
  }

  Future<void> sendPasswordReset(String email) =>
      _auth.sendPasswordResetEmail(email: email);

  Future<void> signOut() async {
    await _google.signOut();
    await _auth.signOut();
  }

  /// Makes sure users/{uid} exists. New accounts get role "user".
  /// Runs in a transaction so two calls at the same time can't overwrite each other.
  Future<Map<String, dynamic>> _ensureUserDocument(User user, {String? name}) {
    final ref = _users.doc(user.uid);
    return _firestore.runTransaction((tx) async {
      final snap = await tx.get(ref);
      if (snap.exists) return snap.data()!;

      final data = AppUserModel.newUserDocument(user, name: name);
      tx.set(ref, data);
      return data;
    });
  }
}
