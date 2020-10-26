import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/recipe_search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context)=> LoginScreen(),
          RegistrationScreen.id: (context)=> RegistrationScreen(),
          MenuScreen.id: (context)=> MenuScreen(),
          RecipeSearch.id: (context)=> RecipeSearch(),

        }
    );
  }
}
