import 'package:flutter/material.dart';
import 'package:food/src/data/cart_data.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/screens/details/widgets/product_info.dart';
import 'package:food/src/screens/details/widgets/product_images.dart';
import 'package:food/src/screens/details/widgets/product_name.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/default_button.dart';
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
          child: Container(
            width: SizeConfig.screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    text: 'Add To Cart',
                    color: kWhiteColor,
                    textColor: kRedColor,
                    onPress: () {
                      cart.addProductToCart(product);
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: DefaultButton(
                    text: 'Buy Now',
                    color: kRedColor,
                    textColor: kWhiteColor,
                    onPress: () {
                      cart.addProductToCart(product);
                      Navigator.pop(context);
                      provider.currentIndex = 1;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
