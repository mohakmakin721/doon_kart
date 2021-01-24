import 'package:doon_kart/screens/home/components/popular_product.dart';
import 'package:doon_kart/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(20)),
          DiscountBanner(),
          SizedBox(height: getProportionateScreenWidth(20)),
          Categories(),
          SizedBox(height: getProportionateScreenWidth(20)),
          SpecialOffers(),
          SizedBox(height: getProportionateScreenWidth(20)),
          PopularProducts(),
          SizedBox(height: getProportionateScreenWidth(20)),
        ],
      ),
    ));
  }
}