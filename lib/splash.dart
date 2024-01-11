import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    var duration = Duration(seconds: 2);
    Timer(duration, () {
      navigateToNewPage(context); 
    });
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/homepage');
    print("Navigating to new page");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Container(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset('assets/play.png',
              // width: 150,
              // height: 150,),
              SizedBox(height: 20),
              CircularProgressIndicator(
                color: const Color.fromARGB(255, 193, 29, 29),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
