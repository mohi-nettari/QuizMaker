import 'package:firebase_auth/firebase_auth.dart';

import '../models/simpleUser.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  SimpleUser? _userFromFirebaseUser(User user) {
    return user != null ? SimpleUser(uid: user.uid) : null;
  }

  Future signInEmailAndPAssword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? fireBaseUser = _auth.currentUser;
      return _userFromFirebaseUser(fireBaseUser!);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = authResult.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
