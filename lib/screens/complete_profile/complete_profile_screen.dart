import 'package:doon_kart/screens/complete_profile/components/complete_profile_body.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName="/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: CompleteProfileBody(

      ),
    );
  }
}
