import 'package:tawi/screens/volunteers/create_profile_screen.dart';
import 'package:tawi/screens/institutions/create_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileCreation extends StatefulWidget {
  final String uid;
  final String email;
  const ProfileCreation({ required this.uid, required this.email });

  @override
  _ProfileCreationState createState() => _ProfileCreationState();
}

class _ProfileCreationState extends State<ProfileCreation> {
  
  bool showVolunteer = true;
  void toggleView(){
    //print(showVolunteer.toString());
    setState(() => showVolunteer = !showVolunteer);
  }

  @override
  Widget build(BuildContext context) {
    if (showVolunteer) {
      return VolunteerProfileCreationScreen(uid:widget.uid,email:widget.email, toggleView:  toggleView);
    } else {
      return InstitutionProfileCreationScreen(uid:widget.uid, email:widget.email,toggleView:  toggleView);
    }
  }
}