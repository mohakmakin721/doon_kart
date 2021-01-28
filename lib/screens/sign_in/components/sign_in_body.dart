import 'package:doon_kart/components/no_account_text.dart';
import 'package:doon_kart/components/social_card.dart';
import 'package:doon_kart/screens/login_success/login_success_screen.dart';
import 'package:doon_kart/screens/sign_in/components/sign_form.dart';
import 'package:doon_kart/size_config.dart';
import 'package:doon_kart/components/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Sign in with your email and password \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SignForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
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
              SizedBox(height: getProportionateScreenWidth(20)),
              NoAccountText()
            ]),
          ),
        ),
      ),
    );
  }
}
