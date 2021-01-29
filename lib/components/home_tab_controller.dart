import 'package:doon_kart/screens/favourite/components/favourite_body.dart';
import 'package:doon_kart/screens/home/components/home_body.dart';
import 'package:doon_kart/screens/profile/components/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../contents.dart';

class HomeTabController extends StatefulWidget {
  static String routeName = "/components";

  @override
  _HomeTabControllerState createState() => _HomeTabControllerState();
}

class _HomeTabControllerState extends State<HomeTabController> {
  final Color inActiveIconColor = Color(0xFFB6B6B6);

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeBody(),
    FavouriteBody(),
    HomeBody(),
    HomeBody(),
    ProfileBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        // new
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              color: _currentIndex == 0 ? kPrimaryColor : inActiveIconColor,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              color: _currentIndex == 1 ? kPrimaryColor : inActiveIconColor,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              color: _currentIndex == 2 ? kPrimaryColor : inActiveIconColor,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              color: _currentIndex == 3 ? kPrimaryColor : inActiveIconColor,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: _currentIndex == 4 ? kPrimaryColor : inActiveIconColor,
            ),
            label: 'Profile',
          )
        ],
        selectedLabelStyle: TextStyle(
          color: kPrimaryColor,
        ),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: inActiveIconColor,
        unselectedLabelStyle: TextStyle(color: inActiveIconColor),
      ),
      body: _children[_currentIndex],
    );
    return Container();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
