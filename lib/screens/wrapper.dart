import 'package:flutter/material.dart';
import 'package:tawi/screens/volunteers/volunteer_home_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Return different screens depending on auth state
    return Container(child: VolunteerHome());
  }
}
