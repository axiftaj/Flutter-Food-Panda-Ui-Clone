import 'package:flutter/material.dart';
import 'package:instagram_clone/constats/color.dart';
import 'package:instagram_clone/constats/constants.dart';
import 'package:instagram_clone/dashboard/splash_screen.dart';
import 'package:instagram_clone/dashboard/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // theme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: MyColors.navy,
          brightness: Brightness.light,
          scaffoldBackgroundColor: const Color(0xfffcfcfc),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: .2,
          titleTextStyle:  TextStyle(fontFamily: Bold , color: Color(0xff323232)),
          iconTheme: IconThemeData(color: MyColors.primaryColor)
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
          primarySwatch: MyColors.navy,
          scaffoldBackgroundColor: const Color(0xfffcfcfc),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: .2,
              titleTextStyle:  TextStyle(fontFamily: Bold , color: Color(0xff323232)),
              iconTheme: IconThemeData(color: MyColors.primaryColor)
          )
      ),
      home:  SplashScreen(),
    );
  }
}

