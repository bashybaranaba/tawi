import 'package:flutter/foundation.dart';
import 'package:tawi/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

//NOTE: TawiUser is the custom user model class while User is the firebaseUser model class

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // auth change user stream
  Stream<TawiUser?> get user {
    return _auth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      } else {
        return TawiUser.fromFirebaseUser(firebaseUser);
      }
    });
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
  Future<TawiUser?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return TawiUser(uid: result.user!.uid, email: result.user!.email!);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
  

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    }
  }

}
