import 'package:firebase_auth/firebase_auth.dart';

class TawiUser {
  final String uid;
  final String email;

  TawiUser({required this.uid, required this.email});

  factory TawiUser.fromFirebaseUser(User firebaseUser) {
    return TawiUser(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
    );
  }
}