import 'package:doon_kart/screens/sign_up/compnents/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
