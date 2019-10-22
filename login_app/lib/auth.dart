import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

abstract class Auth {
  Future<String> signInWithEmailAndPassword({String email, String password});
  Future<String> createUserWithEmailAndPassword(
      {String email, String password});
  AuthProblems getAuthException(dynamic e);
  Future<String> currentUser();
  Future<void> signedOut();
}

enum AuthProblems {
  userNotFound,
  invalidMail,
  weakPassword,
  wrongPassword,
  networkError
}

class AuthFirebase extends Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(
      {String email, String password}) async {
    return (await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user
        .uid;
  }

  Future<String> createUserWithEmailAndPassword(
      {String email, String password}) async {
    return (await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user
        .uid;
  }

  AuthProblems getAuthException(dynamic e) {
    AuthProblems errorType;
    switch (e.code) {
      case 'ERROR_INVALID_EMAIL':
        errorType = AuthProblems.invalidMail;
        break;
      case 'ERROR_WEAK_PASSWORD':
        errorType = AuthProblems.weakPassword;
        break;
      case 'ERROR_USER_NOT_FOUND':
        errorType = AuthProblems.userNotFound;
        break;
      case 'ERROR_WRONG_PASSWORD':
        errorType = AuthProblems.wrongPassword;
        break;
      default:
        errorType = AuthProblems.networkError;
        break;
    }
    return errorType;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    if (user == null) return null;
    return user.uid;
  }

  Future<void> signedOut() async {
    return firebaseAuth.signOut();
  }
}
