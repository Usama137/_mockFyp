import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodepie/components/rounded_button.dart';
import 'package:foodepie/components/tracking_text_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';

class AddRecipe extends StatefulWidget {
  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  String title;
  String label;
  String imgUrl;
  String desc;
  String ingredients;
  String direction;

  var addDataId = 5;
  final _formKey = GlobalKey<FormState>();

  TextEditingController textEditingController = new TextEditingController();
  final databaseReference = Firestore.instance;

  @override
  void createRecord() async {
    //print(email);
    await databaseReference.collection("books").document().setData({

      'title': title,
      'labels': label,
      'image': imgUrl,
      'desc': desc,
      'ingredients':ingredients,
      'direction':direction,
    });
    addDataId = addDataId + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(

            child: Column(key: _formKey,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    "Add new recipe",
                    style: TextStyle(
                      fontSize: 27.0,
                      color: Color(0xff080040),

                    ),
                  ),
                ),
                TrackingTextInput(
                  label: "Title",
                  hint: "What's your email address?",
                  colour: Colors.white,
                  onTextChanged: (String value) {
                    title = value;
                    print(title);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TrackingTextInput(
                  label: "Label",
                  hint: "Write related labels",
                  colour: Colors.white,
                  onTextChanged: (String value) {
                    label = value;
                    print(label);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TrackingTextInput(
                  label: "Ingredients",
                  hint: "Write related ingredients",
                  colour: Colors.white,
                  onTextChanged: (String value) {
                    ingredients = value;
                    print(ingredients);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TrackingTextInput(
                  label: "Image Url",
                  hint: "Write url of the recipe image",
                  colour: Colors.white,
                  onTextChanged: (String value) {
                    imgUrl = value;
                    print(imgUrl);
                  },
                ),

                SizedBox(
                  height: 20.0,
                ),
                TrackingTextInput(
                  label: "Directions",
                  hint: "Write directions for recipe",
                  colour: Colors.white,
                  onTextChanged: (String value) {
                    direction = value;
                    print(direction);
                  },
                ),
                /*TextFormField(
                  minLines: 2,
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: 'Directions',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Directions';
                    }
                    return 'submit';
                  },
                  onSaved: (value) {
                    setState(() {
                      direction = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  minLines: 2,
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter description';
                    }
                    print(value);
                    return 'submit';
                  },
                  onSaved: (value) {
                    setState(() {
                      desc = value;
                    });
                  },
                ),*/

                SizedBox(
                  height: 20.0,
                ),
                TrackingTextInput(
                  label: "Description",
                  hint: "Write description",
                  colour: Colors.white,
                  onTextChanged: (String value) {
                    desc = value;
                    print(desc);
                  },

                ),
                SizedBox(
                  height: 20.0,
                ),
                RoundedButton(
                  title: 'Submit Recipe',
                  colour: Color(0xffFBAF02),
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (/*_formKey.currentState.validate()*/ title!=null && label!=null && imgUrl!=null && desc!=null && direction!=null && ingredients!=null) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a databa
                      print(title);
                      createRecord();
                      /*  Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));*/
                    } else {
                      print("something is missing");
                      showDialog(context: context,
                        child: CupertinoAlertDialog(
                          title: Text("Alert!",
                            style: TextStyle(
                              color: Colors.red,
                            ),),
                          content: Text("Credentials are missing",
                            style: TextStyle(
                              fontSize: 15.0,

                            ),),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],

                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                /* RaisedButton(
                  child: Text('Create Record'),
                  onPressed: () {
                    createRecord();
                  },
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
