import 'package:flutter/material.dart';
import 'package:tawi/models/user_model.dart';
import 'package:tawi/services/user_service.dart';

class InstitutionProfileCreationScreen extends StatefulWidget {
   final String uid;
  final String email;
  final Function toggleView;
  const InstitutionProfileCreationScreen({ required this.uid,required this.email,required this.toggleView });

  @override
  _InstitutionProfileCreationScreenState createState() => _InstitutionProfileCreationScreenState();
}

class _InstitutionProfileCreationScreenState extends State<InstitutionProfileCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _interestsController = TextEditingController();

  String _institutionName = '';
  String _email = '';
  String _description = '';
  String _address = '';
  String _phone = '';
  String _website = '';
  String _imageUrl = '';

  void _saveProfile() async {
    await UserService(uid:widget.uid, email:widget.email).createInstitution( _institutionName, _imageUrl, _description, _address, _phone, _website );

    // Navigate to the volunteer's profile page
    // or to the home screen, for example
  }

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
                  'Create Institution profile',
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
                  setState(() => _institutionName = val);
                },
                validator: (val) =>
                    !val!.contains('@') ? 'Please enter your organization name' : null,
                decoration: InputDecoration(
                  hintText: "Organization Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => _website = val);
                },
                validator: (val) =>
                    !val!.contains('https') ? 'Please enter a valid url' : null,
                decoration: InputDecoration(
                  hintText: "Website",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
             const SizedBox(height: 10.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => _description = val);
                },
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )  
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                    width: double.infinity,
                child:ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _saveProfile();
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
                    "I am a volunteer! Create volunteer profile",
                    
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
    );
  }
}