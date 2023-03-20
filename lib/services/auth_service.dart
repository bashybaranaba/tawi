import 'package:flutter/foundation.dart';
import 'package:tawi/models/user_model.dart';
import 'package:tawi/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//NOTE: TawiUser is the custom user model class while User is the firebaseUser model class

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

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
      await UserService(uid: result.user!.uid, email:email).updateUserData(email, '-', 0);
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
