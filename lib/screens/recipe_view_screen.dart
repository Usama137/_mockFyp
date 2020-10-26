import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class RecipeView extends StatefulWidget {
  final String postUrl;
  RecipeView({@required this.postUrl});
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  String finalUrl ;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    finalUrl = widget.postUrl;
    if(widget.postUrl.contains('http://')){
      finalUrl = widget.postUrl.replaceAll("http://","https://");
      print(finalUrl + "this is final url");
    }

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

      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

        child: WebView(
          onPageFinished: (val){
            print(val);
          },
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: finalUrl,
          onWebViewCreated: (WebViewController webViewController){
            setState(() {
              _controller.complete(webViewController);
            });
          },
        ),


      ),
    );
  }
}
