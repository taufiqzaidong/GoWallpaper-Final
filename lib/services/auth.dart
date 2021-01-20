import 'package:gowallpaper/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebasedUseer
  UserId _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? UserId(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserId> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sing in anon
  Future signinAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser userFirebase = result.user;
      return _userFromFirebaseUser(userFirebase);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser userFirebase = result.user;
      return _userFromFirebaseUser(userFirebase);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser userFirebase = result.user;

      return _userFromFirebaseUser(userFirebase);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
