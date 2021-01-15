import 'package:doon_kart/components/custom_suffix_icon.dart';
import 'package:doon_kart/components/default_button.dart';
import 'package:doon_kart/components/form_error.dart';
import 'package:doon_kart/components/social_card.dart';
import 'package:doon_kart/screens/sign_up/compnents/sign_up_form.dart';
import 'package:doon_kart/size_config.dart';
import 'package:flutter/material.dart';

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
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Text(
                "By continuing you confirm that you agree \nwith out Term and Condition",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
