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
  bool _isSelectedDiabetic = false;
  bool _isSelectedBp = false;

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
                  height: 24.0,
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
