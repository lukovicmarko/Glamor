import 'package:flutter/material.dart';
import 'package:food/src/data/cart_data.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/screens/details/widgets/cart_buttons.dart';
import 'package:food/src/screens/details/widgets/product_info.dart';
import 'package:food/src/screens/details/widgets/product_images.dart';
import 'package:food/src/screens/details/widgets/product_name.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  Body({@required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartData>(context);
    final provider = Provider.of<BottomNavigationBarProvider>(context);
    return Stack(
      children: [
        Column(
          children: [
            ProductImages(product: product),
            ProductName(product: product),
            ProductInfo(product: product),
          ],
        ),
        Positioned(
          bottom: 10,
          child: CartButtons(cart: cart, product: product, provider: provider),
        ),
      ],
    );
  }
}
