import 'package:doon_kart/components/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName="/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
