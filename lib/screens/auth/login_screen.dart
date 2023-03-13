import 'package:flutter/material.dart';
import 'package:tawi/services/auth_service.dart';

class LogIn extends StatefulWidget {
  final Function toggleView;
  const LogIn({super.key,  required this.toggleView });
  
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  

  String error = '';
  bool loading = false;

  late String _email;
  late String _password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 45.0),
                  const Center(
                    child: Text(
                      'TAWI',
                      style: TextStyle(
                        color:Colors.teal,
                        fontSize: 30.0,
                        fontFamily: 'Genos',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const Center(
                    child: Text(
                      'Join the mission for a sustainable future',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) {
                      setState(() => _email = val);
                    },
                    validator: (val) =>
                        !val!.contains('@') ? 'Invalid Email' : null,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => _password = val);
                    },
                    validator: (val) =>
                        val!.length < 6 ? 'Password too short' : null,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          setState(() => loading = true);
                          dynamic result = await _auth.signInWithEmailAndPassword(_email, _password);
                          if(result == null) {
                            setState(() {
                              loading = false;
                              error = 'Could not sign in with those credentials';
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[500],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                      ),
                      child:const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  
                  Text(
                    error,
                    style: const TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  const SizedBox(height: 15.0),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.teal[500],
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Center(
                    child: GestureDetector(
                      onTap: ()  =>  widget.toggleView(),
                      child: const Text(
                        "Don't have an account? Register",
                        
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
