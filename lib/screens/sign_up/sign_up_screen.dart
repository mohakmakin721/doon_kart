import 'package:doon_kart/screens/sign_up/components/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body:  Builder(builder: (context){
        return SignUpBody();
      })
    );
  }
}
