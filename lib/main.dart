import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawi/screens/wrapper.dart';
import 'package:tawi/models/user_model.dart';
import 'package:tawi/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
   @override
  Widget build(BuildContext context) {
    return StreamProvider<TawiUser>.value(
      value: AuthService().user,
      initialData: TawiUser(uid: ''),
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

