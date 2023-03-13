import 'package:flutter/material.dart';
import 'package:tawi/screens/community/community_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Return different screens depending on auth state
    return const Community();
  }
}
