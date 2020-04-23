import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:foodepie/components/rounded_button.dart';
import 'package:foodepie/components/tracking_text_input.dart';
import 'package:foodepie/components/input_helper.dart';
import 'package:foodepie/components/constants.dart';
import 'package:foodepie/components/teddy_controller.dart';
import 'package:foodepie/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  TeddyController _teddyController;
  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFBAF02),
        title: Text(
          'Login',
          style: TextStyle(
            color: Color(0xff080040),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: 200,
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlareActor(
                      "login_teddy/Teddy.flr",
                      shouldClip: false,
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.contain,
                      controller: _teddyController,
                    )),
                TrackingTextInput(
                  label: "Email",
                  hint: "What's your email address?",
                  colour: Colors.white,
                  onCaretMoved: (Offset caret) {
                    _teddyController.lookAt(caret);
                  },
                  onTextChanged: (String value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                TrackingTextInput(
                  label: "Password",
                  hint: "Try try and try...",
                  isObscured: true,
                  onCaretMoved: (Offset caret) {
                    _teddyController.coverEyes(caret != null);
                    _teddyController.lookAt(null);
                  },
                  onTextChanged: (String value) {
                    password = value;
                  },
                ),
                RoundedButton(
                  title: 'Log In',
                  colour: Color(0xffFBAF02),
                  onPressed: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, RegistrationScreen.id);
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
