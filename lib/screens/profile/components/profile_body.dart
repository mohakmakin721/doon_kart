import 'package:doon_kart/components/authentication_service.dart';
import 'package:doon_kart/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {context
                  .read<AuthenticationService>()
                  .signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(SignInScreen.routeName, (Route<dynamic> route) => false);},
            ),
          ],
        ),
      ),
    );
  }
}
