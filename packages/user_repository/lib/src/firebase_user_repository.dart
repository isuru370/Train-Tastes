import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookAuth facebookAuth = FacebookAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

  @override
  Future<void> signInEmail(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signInUpGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    try {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final userDetails =
          (await _firebaseAuth.signInWithCredential(credential)).user;
      MyUser myUser = MyUser(
        userId: userDetails!.uid,
        name: userDetails.displayName!,
        email: userDetails.email!,
        userImageUrl: userDetails.photoURL!,
      );

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }

    // if (googleSignInAccount != null) {
    //   try {
    //     final GoogleSignInAuthentication googleSignInAuthentication =
    //         await googleSignInAccount.authentication;
    //     final AuthCredential credential = GoogleAuthProvider.credential(
    //       accessToken: googleSignInAuthentication.accessToken,
    //       idToken: googleSignInAuthentication.idToken,
    //     );
    //     final userDetails =
    //         (await _firebaseAuth.signInWithCredential(credential)).user;
    //     // myUser = myUser.copyWith(
    //     //   userId: userDetails!.uid,
    //     //   name: userDetails.displayName,
    //     //   email: userDetails.email,
    //     //   userImageUrl: userDetails.photoURL,
    //     // );
    //     return true;
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'account-exists-with-different-credential') {
    //       log("You already have an account with us, Use correct Provider");
    //       return false;
    //     } else if (e.code == "null") {
    //       log("same unexpected error while trying to sign in");
    //       return false;
    //     } else {
    //       log(e.toString());
    //     }
    //     log(e.toString());
    //     rethrow;
    //   }
    // } else {
    //   return false;
    // }
  }

  @override
  Future<MyUser> signInUpFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    final AuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.tokenString);

    UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
    MyUser myUser = MyUser(
      userId: userCredential.user!.uid,
      name: userCredential.user!.displayName!,
      email: userCredential.user!.email!,
      userImageUrl: userCredential.user!.photoURL!,
    );
    return myUser;
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> setUser(MyUser myUser) async {
    final documentSnapshot = await userCollection.doc(myUser.userId).get();
    try {
      if (!documentSnapshot.exists) {
        await userCollection
            .doc(myUser.userId)
            .set(myUser.toEntity().toDocument());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> getUser(String myUserId) async {
    try {
      return userCollection.doc(myUserId).get().then((value) =>
          MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
