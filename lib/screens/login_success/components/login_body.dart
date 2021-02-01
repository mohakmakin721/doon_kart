import 'package:doon_kart/components/default_button.dart';
import 'package:doon_kart/components/home_tab_controller.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset("assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to Home",
            press: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  HomeTabController.routeName, (Route<dynamic> route) => false);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
