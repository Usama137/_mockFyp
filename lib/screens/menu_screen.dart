import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:foodepie/screens/pantry.dart';
import 'health_report.dart';
import 'add_recipe_screen.dart';
import 'recipe_search_screen.dart';
import 'user.dart';

class MenuScreen extends StatefulWidget {
  static const String id = 'menu_screen';
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int currentIndex;
  Function changePage;
  int i = 2;
  var pages = [
    new User(),
    new HealthReport(),
    new Pantry(),
    new HealthReport(),
    new AddRecipe(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[i],
      appBar: AppBar(
        backgroundColor: Color(0xffFBAF02),
        //elevation: 4.0,
        title: Center(
          child: Text(
            'Food-e-Pie',
            style: TextStyle(
              fontFamily: 'Pacifico',
              color: Color(0xff080040),
              //fontSize: 12.0
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // showSearch(context: context, delegate: Article)
                Navigator.pushNamed(context, RecipeSearch.id);
              })
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xffFBAF02),
        height: 55,

        items: <Widget>[
          Icon(Icons.account_circle, size: 25, color: Colors.white,),
          Icon(Icons.assistant, size: 25, color: Colors.white,),
          Icon(Icons.kitchen, size: 25, color: Colors.white,),
          Icon(Icons.table_chart, size: 25, color: Colors.white,),
          Icon(Icons.add, size: 25, color: Colors.white,),




        ],
        /*index: 2,
        animationDuration: Duration(
          milliseconds: 200,
        ),*/
        index: i,
        //type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            i = index;
          });
          //Handle button tap
        },
      ),
    );
  }
}
