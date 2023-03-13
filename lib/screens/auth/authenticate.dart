import 'package:tawi/screens/auth/register_screen.dart';
import 'package:tawi/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLogIn = true;
  void toggleView(){
    //print(showLogIn.toString());
    setState(() => showLogIn = !showLogIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogIn) {
      return LogIn(toggleView:  toggleView);
    } else {
      return Register(toggleView:  toggleView);
    }
  }
}