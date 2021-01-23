import 'package:doon_kart/components/authentication_service.dart';
import 'package:doon_kart/components/social_card.dart';
import 'package:doon_kart/screens/login_success/login_success_screen.dart';
import 'package:doon_kart/screens/sign_up/components/sign_up_form.dart';
import 'package:doon_kart/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../contents.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              // 7% of total height
              SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              // 7% of total height
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/google-icon.svg",
                    press: () {
                      context
                          .read<AuthenticationService>()
                          .signInWithGoogle()
                          .then((result) {
                        if (result != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginSuccessScreen();
                              },
                            ),
                          );
                        }
                      }).catchError((onError){
                        final snackBar = SnackBar(content: Text(onError+""));
                        Scaffold.of(context).showSnackBar(snackBar);
                      });
                    },
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {
                      context
                          .read<AuthenticationService>()
                          .signInWithFacebook(context)
                          .then((user) {
                        if (user != null) {
                          print('Logged in successfully.');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginSuccessScreen();
                              },
                            ),
                          );
                        } else {
                          print('Error while Login.');
                        }
                      }).catchError((onError){
                        final snackBar = SnackBar(content: Text(onError+""));
                        Scaffold.of(context).showSnackBar(snackBar);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Text(
                "By continuing you confirm that you agree \nwith our Term and Condition",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
