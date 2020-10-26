import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:chips_choice/chips_choice.dart';

class Pantry extends StatefulWidget {
  @override
  _PantryState createState() => _PantryState();
}

class _PantryState extends State<Pantry> {
  Color selectedColor = Colors.grey;
  Color activeButtonColor = Colors.amberAccent;
//Dairy
  List<String> dairyTags = ['Dairy'];
  List<String> dairyOptions = [
    'butter',
    'egg',
    'milk',
    'cheddar',
    'american cheese',
    'sour cream',
    'cream cheese',
    'yougart',
    'cream',
    'swiss cheeses',
    'butter milk',
    'buttermilk',
    'ghee',
    'fontina',
    'halloumi',
    'paneer',
  ];
  List<String> exDairyTags = ['Dairy'];
  List<String> exDairyOptions = [
    'butter',
    'egg',
    'milk',
    'cheddar',
    'american cheese',
    'sour cream',
    'cream cheese',
    'yougart',
    'cream',
    'swiss cheeses',
    'butter milk',
    'buttermilk',
    'ghee',
    'fontina',
    'halloumi',
    'paneer',
    'goat cheese',
    'blue cheese',
    'soft cheese',
    'gouda',
    'gruyere',
    'muenster',
    'brick cheese',
    'asiago',
    'custard',
  ];


//Baking and Grains
  List<String> bgTags = ['Baking'];
  List<String> bgOptions = [
    'rice',
    'pasta',
    'flour',
    'bread',
    'baking powder',
    'baking soda',
    'bread crumbs',
    'corn starch',
    'cocoa',
    'wild rice',
    'noodle',
    'yeast',
    'pop corn',
    'biscuits',
    'cereal',
    'chips',
  ];

  //Baking expanded
  List<String> exBgTags = ['Baking'];
  List<String> exBgOptions = [
    'rice',
    'pasta',
    'flour',
    'bread',
    'baking powder',
    'baking soda',
    'bread crumbs',
    'corn starch',
    'cocoa',
    'wild rice',
    'noodle',
    'yeast',
    'pop corn',
    'biscuits',
    'cereal',
    'chips',
    'cracker',
    'cake mix',
    'macroni cheese mix',
    'ramen',
    'coconut flake',
    'pizza dough',
    'puff pastery',
    'barley',
    'cornflour',
    'cream of wheat',
    'muffin mix',
    'bread dough',
  ];

  //Color inactiveButtonColor=Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: null,
          label: Text('Search Recipe', style: TextStyle(
            color: Color(0xff080040),
          ),),
          backgroundColor: Color(0xffFBAF02),
      ),
      body: SingleChildScrollView(

        child: Container(

          color: Colors.white,
          child: Column(
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('My Ingredients',
                  style: TextStyle(
                    fontSize: 27,
                    color: Color(0xff080040)
                  ),),
              ),
              Text(
                'Select ingredients and we will recommend you recipe',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey
                ),
              ),
              Text(
                'Eat good, feel good',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                borderOnForeground: true,
                margin: EdgeInsets.all(15.0),
                elevation: 15,
                child: ExpandablePanel(
                  header: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          "images/dairy.jpg",
                          fit: BoxFit.fill,
                        ),
                        //"images/logo1.png",
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Dairy",
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Pacifico',
                            color: Color(0xff080040),
                          ),
                        ),
                      ),
                    ],
                  ),
                  collapsed: Wrap(
                    children: <Widget>[
                      ChipsChoice.multiple(

                        value: dairyTags,
                        options: ChipsChoiceOption.listFrom<String, String>(
                          source: dairyOptions,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        itemConfig: ChipsChoiceItemConfig(
                          selectedColor: Colors.green,
                          unselectedColor: Colors.blueGrey,
                          selectedBrightness: Brightness.dark,
                         unselectedBrightness: Brightness.dark,
                          showCheckmark: false,
                          labelStyle: TextStyle(
                            color: Colors.black,

                          )
                        ),
                        onChanged: (val) => setState(() => dairyTags = val),
                        isWrapped: true,
                      ),
                    ],
                  ),
                  expanded: Wrap(
                    children: <Widget>[
                      ChipsChoice.multiple(
                        value: exDairyTags,
                        options: ChipsChoiceOption.listFrom<String, String>(
                          source: exDairyOptions,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        itemConfig: ChipsChoiceItemConfig(
                          selectedColor: Colors.green,
                          unselectedColor: Colors.blueGrey,
                          selectedBrightness: Brightness.dark,
                          unselectedBrightness: Brightness.dark,
                          showCheckmark: false,

                        ),
                        onChanged: (val) => setState(() => exDairyTags = val),
                        isWrapped: true,
                      ),
                    ],
                  ),
                  tapHeaderToExpand: true,
                  hasIcon: true,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                borderOnForeground: true,
                margin: EdgeInsets.all(15.0),
                elevation: 15,
                child: ExpandablePanel(
                  header: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          "images/baking.JPG",
                          fit: BoxFit.fill,
                        ),
                        //"images/logo1.png",
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Baking & Grains",
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Pacifico',
                            color: Color(0xff080040),
                          ),
                        ),
                      ),
                    ],
                  ),
                  collapsed: Wrap(
                    children: <Widget>[
                      ChipsChoice.multiple(
                        value: bgTags,
                        options: ChipsChoiceOption.listFrom<String, String>(
                          source: bgOptions,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        itemConfig: ChipsChoiceItemConfig(
                          selectedColor: Colors.green,
                          unselectedColor: Colors.blueGrey,
                          selectedBrightness: Brightness.dark,
                          unselectedBrightness: Brightness.dark,
                          showCheckmark: false,
                        ),
                        onChanged: (val) => setState(() => bgTags = val),
                        isWrapped: true,
                      ),
                    ],
                  ),
                  expanded: Wrap(
                    children: <Widget>[
                      ChipsChoice.multiple(
                        value: exBgTags,
                        options: ChipsChoiceOption.listFrom<String, String>(
                          source: exBgOptions,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        itemConfig: ChipsChoiceItemConfig(
                          selectedColor: Colors.green,
                          unselectedColor: Colors.blueGrey,
                          selectedBrightness: Brightness.dark,
                          unselectedBrightness: Brightness.dark,
                          showCheckmark: false,
                        ),
                        onChanged: (val) => setState(() => exBgTags = val),
                        isWrapped: true,
                      ),
                    ],
                  ),
                  tapHeaderToExpand: true,
                  hasIcon: true,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                borderOnForeground: true,
                margin: EdgeInsets.all(15.0),
                elevation: 15,
                child: ExpandablePanel(
                  header: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          "images/baking.JPG",
                          fit: BoxFit.fill,
                        ),
                        //"images/logo1.png",
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Baking & Grains",
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Pacifico',
                            color: Color(0xff080040),
                          ),
                        ),
                      ),
                    ],
                  ),
                  collapsed: Wrap(
                    children: <Widget>[
                      ChipsChoice.multiple(
                        value: bgTags,
                        options: ChipsChoiceOption.listFrom<String, String>(
                          source: bgOptions,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        itemConfig: ChipsChoiceItemConfig(
                          selectedColor: Colors.green,
                          unselectedColor: Colors.blueGrey,
                          selectedBrightness: Brightness.dark,
                          unselectedBrightness: Brightness.dark,
                          showCheckmark: false,
                        ),
                        onChanged: (val) => setState(() => bgTags = val),
                        isWrapped: true,
                      ),
                    ],
                  ),
                  expanded: Wrap(
                    children: <Widget>[
                      ChipsChoice.multiple(
                        value: exBgTags,
                        options: ChipsChoiceOption.listFrom<String, String>(
                          source: exBgOptions,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        itemConfig: ChipsChoiceItemConfig(
                          selectedColor: Colors.green,
                          unselectedColor: Colors.blueGrey,
                          selectedBrightness: Brightness.dark,
                          unselectedBrightness: Brightness.dark,
                          showCheckmark: false,
                        ),
                        onChanged: (val) => setState(() => exBgTags = val),
                        isWrapped: true,
                      ),
                    ],
                  ),
                  tapHeaderToExpand: true,
                  hasIcon: true,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




//initial card
/*Card(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15.0),
),
borderOnForeground: true,
margin: EdgeInsets.all(15.0),
elevation: 15,
child: Container(
height: 300,
width: 380,
child: Wrap(
children: <Widget>[
Row(
children: <Widget>[
Container(
margin: EdgeInsets.only(left: 15, top: 10),
height: 50,
width: 50,
child: Image.asset(
"images/baking.JPG",
fit: BoxFit.fill,
),
//"images/logo1.png",
),
Container(
margin: EdgeInsets.only(left: 10),
child: Text(
"Baking & Grains",
style: TextStyle(
fontSize: 23,
fontFamily: 'Pacifico',
color: Color(0xff080040),
),
),
),
],
),
ChipsChoice.multiple(
value: bgTags,
options: ChipsChoiceOption.listFrom<String, String>(
source: bgOptions,
value: (i, v) => v,
label: (i, v) => v,
),
itemConfig: ChipsChoiceItemConfig(
selectedColor: Colors.green,
unselectedColor: Colors.blueGrey,
selectedBrightness: Brightness.dark,
unselectedBrightness: Brightness.dark,
showCheckmark: false,
),
onChanged: (val) => setState(() => bgTags = val),
isWrapped: true,
),
],
)),
),*/

/* margin: EdgeInsets.all(15),
                decoration: BoxDecoration(

                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(

                      color: Colors.white.withOpacity(0.0),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

 */