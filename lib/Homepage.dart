import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  late WebViewController controller;
  double progress = 0.0; 
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        } else {
          return true;
        } 
      },
      
      child: Scaffold(
       backgroundColor: Colors.black,
        
        body: Stack(
          
          children: [
            WebView(
              initialUrl: "https://radio.central.edu.gh/indexx",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                controller = webViewController;
              },
              
              onProgress: (progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
             
            ),
            if (progress < 1.0)
              Center(
                child: CircularProgressIndicator(
                  value: progress,
                  backgroundColor: Color.fromARGB(255, 214, 9, 16),
                ),
              ),
          ],
        ),

      ),
      );  
  }
}