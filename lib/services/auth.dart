import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:ssp_extreme/shared/models/custom_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create CustomUser Model based on Firebase User
  CustomUser? _userFromFirebaseuser(User? user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseuser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //sign in with email and passwort

  //register with email and passwort

  //sign out
}
