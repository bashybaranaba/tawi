import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    //TODO: Return different screens depending on auth state
    return Container(
      child: Text('It works')
    );
  }
}