import 'package:flutter/foundation.dart';
import 'package:tawi/screens/auth/authenticate.dart';
import 'package:tawi/screens/volunteers/volunteer_home_screen.dart';
import 'package:tawi/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawi/services/auth_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = context.watch<TawiUser?>();
    if (kDebugMode) {
      print(user);
    }
    
    // return either the Home or Authenticate widget
    
    if (user == null){
      return Authenticate();
    } else {
      return VolunteerHome();
    }
    
    
  }
}
