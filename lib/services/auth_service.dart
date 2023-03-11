import 'package:flutter/foundation.dart';
import 'package:tawi/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

//NOTE: TawiUser is the custom user model class while User is the firebaseUser model class

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  TawiUser _userFromFirebaseUser(User user) {
    return TawiUser(uid: user.uid);
  }

  // auth change user stream
  Stream<TawiUser> get user {
    return _auth.authStateChanges()
      .map((User? user) => _userFromFirebaseUser(user!));
   
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    } 
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    } 
  }

}
