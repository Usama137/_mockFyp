import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodepie/components/constants.dart';
import 'package:foodepie/components/rounded_button.dart';
import 'package:foodepie/components/LabeledCheckbox.dart';
import 'package:foodepie/components/tracking_text_input.dart';
import 'package:foodepie/screens/welcome_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registeration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String name;
  String phone;
  bool _isSelectedDiabetic = false;
  bool _isSelectedBp = false;
  bool _isSelectedVege=false;
  bool _isSelectedChine=false;
  bool _isSelectedChiken=false;
  bool _isSelectedMutton=false;
  bool _isSelectedBeef=false;
  String otherInterest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffFBAF02),
        title: Text(
          'Register',
          style: TextStyle(
            color: Color(0xff080040),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Basic Information',style: TextStyle(
                  fontSize: 27.0,
                  color: Color(0xff080040),
                ),
                ),
                //for full name
                TrackingTextInput(
                  label: "Full Name",
                  hint: "What's your full name?",
                  colour: Color(0xff080040),
                  onTextChanged: (String value) {
                    name= value;
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                //for email
                TrackingTextInput(
                  label: "Email",
                  hint: "What's your email address?",
                  colour: Color(0xff080040),
                  onTextChanged: (String value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                // for password
                TrackingTextInput(
                  label: "Password",
                  hint: "Enter your password. ",
                  colour: Color(0xff080040),
                  onTextChanged: (String value) {
                    password = value;
                  },
                ),

                SizedBox(
                  height: 8.0,
                ),
                TrackingTextInput(
                  label: "Phone",
                  hint: "Enter your phone number. ",
                  colour: Color(0xff080040),
                  onTextChanged: (String value) {
                    phone = value;
                  },
                ),

                SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Interest',style: TextStyle(
                  fontSize: 27.0,
                  color: Color(0xff080040),
                ),
                ),
                LabeledCheckbox(
                  label: 'Do you like vegetables?',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: _isSelectedVege,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelectedVege = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Do you like Chinese?',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: _isSelectedChine,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelectedChine = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Do you like Chiken?',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: _isSelectedChiken,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelectedChiken = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Do you like Mutton?',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: _isSelectedMutton,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelectedMutton = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Do you like Beef?',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: _isSelectedBeef,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelectedBeef = newValue;
                    });
                  },
                ),
                TrackingTextInput(
                  label: "Other interest",
                  hint: "Do you have any other interest(italian etc)?",
                  colour: Color(0xff080040),
                  onTextChanged: (String value) {
                    otherInterest= value;
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),

                Text(
                  'Disease',style: TextStyle(
                  fontSize: 27.0,
                  color: Color(0xff080040),
                ),
                ),
                LabeledCheckbox(
                  label: 'Are you Diabetic patient?',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: _isSelectedDiabetic,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelectedDiabetic = newValue;
                    });
                  },
                ),

                LabeledCheckbox(
                  label: 'Do you have Blood pressure trouble?',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: _isSelectedBp,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelectedBp = newValue;
                    });
                  },
                ),
                TrackingTextInput(
                  label: "Other Disease",
                  hint: "If you have any other disease, please mention.",
                  colour: Color(0xff080040),
                  onTextChanged: (String value) {
                    otherInterest= value;
                  },
                ),
                RoundedButton(
                  title: 'Register',
                  colour: Color(0xffFBAF02),
                  onPressed: () async {
                    //print(email);
                    //print(password);
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
