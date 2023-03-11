import 'package:flutter/foundation.dart';
import 'package:tawi/screens/auth/login_screen.dart';
import 'package:tawi/screens/auth/register_screen.dart';
import 'package:tawi/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TawiUser>(context);
    if (kDebugMode) {
      print(user);
    }
    
    return Register();
  }
}