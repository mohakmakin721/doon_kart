import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doon_kart/components/product_card.dart';
import 'package:doon_kart/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';


class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DynamicProducts(),
        )
      ],
    );
  }
}

class DynamicProducts extends StatefulWidget {
  @override
  _DynamicProductsState createState() => _DynamicProductsState();
}

class _DynamicProductsState extends State<DynamicProducts> {
  int id = 0;
  String title = "", description = "";
  List<String> images = List<String>();
  List<Color> colors = new List<Color>();
  double rating = 0, price = 0;
  bool isFavourite = false, isPopular = false;
  List<Product> dummyProducts = new List<Product>();

  @override
  void initState() {
    retrieveProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          dummyProducts.length,
          (index) {
            if (dummyProducts[index].isPopular)
              return ProductCard(product: dummyProducts[index]);
            return SizedBox.shrink(); // here by default width and height is 0
          },
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
      ],
    );
  }

  void _initializeProducts() {
    id = 0;
    title = "";
    description = "";
    images = List<String>();
    colors = new List<Color>();
    rating = 0;
    price = 0;
    isFavourite = false;
    isPopular = false;
  }

  void _dynamicProducts() {
    setState(() {
      dummyProducts.add(Product(
        id: id,
        images: images,
        colors: colors,
        title: title,
        price: price,
        description: description,
        rating: rating,
        isFavourite: isFavourite,
        isPopular: isPopular,
      ));
    });
  }

  void retrieveProducts() {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    products.snapshots().listen((querySnapshot) {
      querySnapshot.docChanges.forEach((element) {
        dummyProducts = new List<Product>();
      });
      querySnapshot.docs.forEach((element) {
        print(element.data());
        element.data().forEach((key, value) {
          if (key == "colors") {
            List.from(value).forEach((element) {
              colors.add(Color(element));
            });
          } else if (key == "description") {
            description = value;
          } else if (key == "id") {
            id = value;
          } else if (key == "images") {
            List.from(value).forEach((element) {
              images.add(element);
            });
          } else if (key == "isFavourite") {
            isFavourite = value;
          } else if (key == "isPopular") {
            isPopular = value;
          } else if (key == "price") {
            price = double.parse(value.toString());
          } else if (key == "rating") {
            rating = double.parse(value.toString());
          } else if (key == "title") {
            title = value;
          }
        });
        _dynamicProducts();
        _initializeProducts();
      });
    });

  }
}
