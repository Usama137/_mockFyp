import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: Text('Change Password', style: TextStyle(
          color: Color(0xff080040),
        ),),
        backgroundColor: Color(0xffFBAF02),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    height: 120,
                    width: 120,
                    child: Image.asset('images/usamaC.png', fit: BoxFit.fill),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Usama Naeem',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff080040),
                        ),
                      ),
                      Text(
                        'usama@email.com',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  )
                ],
              ),
              Container(

                margin: EdgeInsets.only(left: 14, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Account Information',
                        style: TextStyle(fontSize: 27,
                          color: Color(0xff080040),),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Full Name',

                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff080040),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 267),
                          //alignment:Alignment.topRight ,
                          child: Icon(
                            Icons.edit,
                            color: Colors.black54,

                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Usama Naeem',
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text('Email',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff080040),
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'usama@email.com',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text('Phone',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff080040),
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '+92 300 1234567',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text('Interest',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff080040),
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Chiken, Beef, Mutton, Chinese',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text('Disease',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff080040),
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'N/A',
                      style: TextStyle(
                          fontSize: 14,

                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
 child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                   height: 120,
                   width: 120,
                        child: Image.asset('images/usama.jpg',
                      fit: BoxFit.fill
                        ),
                  ),
                  SizedBox(
                    width: 10,
                  ),

                  Column(
                    children: <Widget>[
                      Text(
                        'Usama Naeem',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'usama@email.com',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                        ),
                      ),
                     /* SizedBox(
                        height: 35,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      )
                         */
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Account Information',
                  style: TextStyle(
                    fontSize: 27,

                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Account Information',
                  style: TextStyle(
                    fontSize: 27,

                  ),

                ),
              ],
            ),
           Text(
             'helo'
           )


          ],


        ),

 */
