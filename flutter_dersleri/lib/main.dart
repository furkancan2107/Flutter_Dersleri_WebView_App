// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text("Flutter Dersleri",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
          fontStyle: FontStyle.italic,),),
          backgroundColor: Colors.blue,

        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Column(children: [

            Expanded(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: WebView(
                  initialUrl: "https://flutterdersleri.com",
                  allowsInlineMediaPlayback: true,
                  debuggingEnabled: false,
                  initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
                  javascriptMode: JavascriptMode.unrestricted,
                  // ignore: prefer_collection_literals
                  javascriptChannels: Set.from([
                    JavascriptChannel(name: "flutter", onMessageReceived: (
                        JavascriptMessage message ){
                      if(message.message == "onSubscribeClick"){
                        // ignore: avoid_print
                        print("onSubscribeClick");
                      }
                    }
                    )
                  ]),
                  onWebResourceError: (websourceerror){
                    print(websourceerror);
                  },



                ),
              ),
            ),
          ],),

        ),
      ),
    );
  }
}

