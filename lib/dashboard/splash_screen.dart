import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/constats/color.dart';
import 'package:instagram_clone/dashboard/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3),
            ()=> Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body:Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash.png')
              )
            ),
          ),
          Positioned(
              bottom: 50 ,
              child: CupertinoActivityIndicator(color: Colors.white,))
        ],
      ),
    );
  }
}
