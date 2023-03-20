import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:tawi/models/user_model.dart';

class UserService {

  final String? uid;
  final String? email;
  UserService({ required this.uid, required this.email });

  //user collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');


  //update user data
  Future<void> updateUserData(String email, String usertype, int i) async {
    try {
       return await userCollection.doc(uid).set({
        'email': email,
        'usertype':usertype,
      });
     
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return;
    }
  }
  //userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserData(
      uid: uid!,
      email:data['email'],
      usertype:data['usertype'],
    );
  }

  //get user data stream
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  //volunteer collection reference
  final CollectionReference volunteerCollection = FirebaseFirestore.instance.collection('volunteers');
  
  Future createVolunteer( String firstname,String lastname, String imageUrl, List<String> interests) async {
    try {
      await volunteerCollection.doc(email).set({
        'uid': uid,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'imageUrl': imageUrl,
        'points': 0,
        'interests': interests,
      });
      await updateUserData(email!, 'volunteer', 0);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }


  //institution collection reference
  final CollectionReference institutionCollection = FirebaseFirestore.instance.collection('institutions');

  Future createInstitution(String name, String imageUrl, String description, String address, String phone,  String website) async {
    try {
      await userCollection.doc(uid).set({
        'uid': uid,
        'name': name,
        'email': email,
        'imageUrl': imageUrl,
        'description': description,
        'address': address,
        'phone': phone,
        'website': website,
      });
      await updateUserData(email!, 'institution', 0);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }


  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //     uid: uid,
  //     email: snapshot.data['email'],
  //     usertype: snapshot.data['usertype'],

  //   );
  // }

   
  // // get user doc stream
  // Stream<UserData> get userData {
  //   return userCollection.document(uid).snapshots()
  //     .map(_userDataFromSnapshot);
  // }
  
}