import 'package:flutter/material.dart';
import 'package:food/src/pages/cart/widgets/card_type.dart';
import 'package:food/src/pages/cart/widgets/checkout_address.dart';
import 'package:food/src/pages/cart/widgets/checkout_buttons.dart';
import 'package:food/src/pages/cart/widgets/checkout_title.dart';
import 'package:food/src/utils/colors.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CheckoutTitle(text: 'Payment method'),
          SizedBox(height: 20),
          CardType(),
          SizedBox(height: 20),
          CheckoutTitle(text: 'Shipping address'),
          SizedBox(height: 10),
          CheckoutAddress(),
          SizedBox(height: 20),
          CheckoutAddress(),
          SizedBox(height: 10),
          CheckoutButtons(),
        ],
      ),
    );
  }
}
