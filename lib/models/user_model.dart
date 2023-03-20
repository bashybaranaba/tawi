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

  get user => null;
}

class UserData {

  final String uid;
  final String email;
  final String usertype;

  UserData({ required this.uid, required this.email, required this.usertype });

}
class VolunteerModel {
  late List<String> interests;

  VolunteerModel({
    required String uid,
    required String email,
    required String name,
    required String imageUrl,
    required int points,
    required this.interests,
  }); 
}

class InstitutionModel {
  late String description;
  late String location;

  InstitutionModel({
    required String id,
    required String email,
    required String name,
    required String imageUrl,
    required int verification,
    required this.description,
    required this.location,
  });
}

