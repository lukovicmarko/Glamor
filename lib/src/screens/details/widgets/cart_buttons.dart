import 'package:flutter/material.dart';
import 'package:food/src/data/cart_data.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/default_button.dart';

class CartButtons extends StatelessWidget {
  CartButtons({
    @required this.cart,
    @required this.product,
    @required this.provider,
  });

  final CartData cart;
  final Product product;
  final BottomNavigationBarProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
