import 'dart:ui';
import 'recipe_view_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodepie/model/recipe_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class RecipeSearch extends StatefulWidget {
  static const String id = 'recipeSearch_screen';
  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

//from=0&to=3&calories=591-722
class _RecipeSearchState extends State<RecipeSearch> {
  List<RecipeModel> recipes = new List<RecipeModel>();
  //final textEditingController = TextEditingController();
  TextEditingController textEditingController = new TextEditingController();
  //String applicationId="677e9bf3";
  //String applicationKey="187eb5bd855f21d421d5765b51abc8a3";
  @override
  void initState() {
    super.initState();
  }

  getRecipes(String query) async {
    print(query);

    String url =
        "https://api.edamam.com/search?q=$query&app_id=677e9bf3&app_key=187eb5bd855f21d421d5765b51abc8a3&&health=alcohol-free";
    var response = await http.get(url);
    print(query);
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["hits"].forEach((element) {
      print(element.toString());
      setState(() {
        RecipeModel recipeModel = new RecipeModel();
        recipeModel = RecipeModel.fromMap(element["recipe"]);

        recipes.add(recipeModel);
      });
    });

    print("${recipes.toString()}");

    // print("$response this is response ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFBAF02),
        title: Text(
          'Recipe Search',
          style: TextStyle(
            fontFamily: 'Pacifico',
            color: Color(0xff080040),
            fontSize: 18.0,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),

          //SizedBox(height: 150.0,),
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      "What will you cook today?",
                      style: TextStyle(
                        color: Color(0xff080040),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Text(
                        "Enter any ingredient & we will get you most related recipe",
                        style: TextStyle(
                          color: Color(0xff080040),
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                  hintText: "Enter ingtredient",
                                  hintStyle: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black45,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                print("just do it");
                                print(textEditingController.text);
                                setState(() {
                                  getRecipes(textEditingController.text);
                                });
                                //getRecipes(textEditingController.text);
                              } else {
                                print("just don't do it");
                                showDialog(context: context,
                                child: CupertinoAlertDialog(
                                  title: Text("Alert!",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),),
                                  content: Text("Please enter any ingredient or recipe name",
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
                            child: Container(
                              child: Icon(Icons.search),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: GridView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisSpacing: 10.0,
                        ),
                        children: List.generate(recipes.length, (index) {
                          return GridTile(
                              child: RecipieTile(
                            title: recipes[index].label,
                            desc: recipes[index].source,
                            imgUrl: recipes[index].image,
                            url: recipes[index].url,
                          ));
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecipieTile extends StatefulWidget {
  final String title, desc, imgUrl, url;
  RecipieTile({this.title, this.desc, this.imgUrl, this.url});

  @override
  _RecipieTileState createState() => _RecipieTileState();
}

class _RecipieTileState extends State<RecipieTile> {
  _launchURL(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
         GestureDetector(
          onTap: () {
            if (kIsWeb) {
              _launchURL(widget.url);
            } else {
              print(widget.url + " this is what we are going to see");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeView(
                        postUrl: widget.url,
                      )));
            }
          },

        child:Container(
          margin: EdgeInsets.all(8),
          child: Stack(
            children: <Widget>[

              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  widget.imgUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 200,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                   // borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                        colors: [Colors.white30, Colors.white],
                        begin: FractionalOffset.centerRight,
                        end: FractionalOffset.centerLeft)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            fontFamily: 'Pacifico'),
                      ),
                      Text(
                        widget.desc,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                            fontFamily: 'Pacifico'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
    ),
         )],

    );

  }
}
