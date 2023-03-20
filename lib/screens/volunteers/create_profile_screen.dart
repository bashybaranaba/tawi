import 'package:flutter/material.dart';
import 'package:tawi/models/user_model.dart';
import 'package:tawi/services/auth_service.dart';
import 'package:tawi/services/user_service.dart';

class VolunteerProfileCreationScreen extends StatefulWidget {
  final String uid;
  final String email;
  final Function toggleView;
  const VolunteerProfileCreationScreen({ required this.uid,required this.email,required this.toggleView });

  @override
  _VolunteerProfileCreationScreenState createState() => _VolunteerProfileCreationScreenState();
}

class _VolunteerProfileCreationScreenState extends State<VolunteerProfileCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _interestsController = TextEditingController();

  final AuthService _auth = AuthService();

  String _firstname = '';
   String _lastname = '';
  String _imageUrl = 'images/default_profile.png';
  List<String> _interests = ["this", "is", "a", "test"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),
              const Center(
                child: Text(
                  'Create your volunteer profile',
                  style: TextStyle(
                    color:Colors.teal,
                    fontSize: 24.0,
                    fontFamily: 'Genos',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => _firstname = val);
                },
                validator: (val) =>
                    val!.length < 2 ? 'Please enter your first name' : null,
                decoration: InputDecoration(
                  hintText: "First Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => _lastname = val);
                },
                validator: (val) =>
                    val!.length < 2 ? 'Please enter your last name' : null,
                decoration: InputDecoration(
                  hintText: "Last Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
             const SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Interests (comma-separated)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                controller: _interestsController,
                onEditingComplete: () {
                  final interests = _interestsController.text
                      .split(',')
                      .map((interest) => interest.trim())
                      .toList();
                  setState(() {
                    _interests = interests;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                    width: double.infinity,
                child:ElevatedButton(
                   onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          dynamic result =  await UserService(uid:widget.uid, email: widget.email, ).createVolunteer( _firstname, _lastname, _imageUrl, _interests);
                          if(result == null){
                            print('error creating profile');
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
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
               Center(
                child: GestureDetector(
                  onTap: ()  => widget.toggleView(),
                  child: const Text(
                    "Are you an institution? Create institution profile",
                    
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
                ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            ],
          ),
        ),
      ),
    );
  }
}