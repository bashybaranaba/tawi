import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tawi/models/user_model.dart';

class UserService {

  //user collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  //implement user functions here
}