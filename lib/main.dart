import 'package:doon_kart/routs.dart';
import 'Theme.dart';
import 'file:///D:/Mohak/Android%20Project/doon_kart/lib/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'contents.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

