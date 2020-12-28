import 'package:doon_kart/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SplashScreen extends StatelessWidget{
  static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
    return Scaffold(
        body: Body(),
    );
  }
  
}
