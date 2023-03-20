import 'package:flutter/foundation.dart';
import 'package:tawi/screens/auth/authenticate.dart';
import 'package:tawi/screens/auth/profile_creation.dart';
import 'package:tawi/screens/community/community_screen.dart';
import 'package:tawi/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawi/screens/volunteers/create_profile_screen.dart';
import 'package:tawi/screens/volunteers/volunteer_home_screen.dart';
import 'package:tawi/services/auth_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = context.watch<TawiUser?>();
    final userData = context.watch<UserData?>();

    if (kDebugMode) {
      print(user);
      print(userData);
      print(userData?.usertype);
    }
    
    // return either the Home or Authenticate widget
    
    if (user == null){
      return Authenticate();
    } else {
      if (userData == null){
        return ProfileCreation(uid: user.uid, email: user.email);
      } else {
        if(userData.usertype == 'volunteer'){
          return VolunteerHome();
        }else{
          return Text("Institution");  }
      }
     
    }
    
    
  }
}
