import 'package:flutter/material.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/screens/details/widgets/product_info.dart';
import 'package:food/src/screens/details/widgets/product_images.dart';
import 'package:food/src/screens/details/widgets/product_name.dart';

class Body extends StatelessWidget {
  Body({@required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ProductImages(product: product),
            ProductName(product: product),
            ProductInfo(product: product),
          ],
        ),
        // DefaultButton(
        //   text: "press",
        //   onPress: () {},
        // ),
      ],
    );
  }
}
