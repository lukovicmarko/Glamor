import 'package:flutter/material.dart';
import 'package:food/src/data/cart_data.dart';
import 'package:food/src/pages/cart/widgets/cart_product.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/default_button.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer<CartData>(builder: (context, cartData, child) {
          return Expanded(
            child: ListView.builder(
                itemCount: cartData.cartCount,
                itemBuilder: (BuildContext context, int index) {
                  return CartProduct(product: cartData.cart[index]);
                }),
          );
        }),
        CartPageTotal(),
      ],
    );
  }
}

class CartPageTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: 60,
      decoration: BoxDecoration(
        color: kRedColor.withOpacity(0.1),
        border: Border(
          top: BorderSide(
            color: kRedColor,
            width: 2.0,
          ),
          bottom: BorderSide(
            color: kRedColor,
            width: 2.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Total: '),
          Text(
            '\$${100}',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(width: 30),
          Container(
            width: 130,
            child: DefaultButton(
              textColor: kWhiteColor,
              color: kRedColor,
              text: 'Checkout',
              onPress: () {},
            ),
          )
        ],
      ),
    );
  }
}
