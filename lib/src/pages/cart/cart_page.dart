import 'package:flutter/material.dart';
import 'package:food/src/data/cart_data.dart';
import 'package:food/src/pages/cart/widgets/cart_page_total.dart';
import 'package:food/src/pages/cart/widgets/cart_product.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartData>(context);

    return cart.cartCount > 0
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cart.cartCount,
                    itemBuilder: (BuildContext context, int index) {
                      return CartProduct(product: cart.cart[index]);
                    }),
              ),
              Visibility(
                child: CartPageTotal(),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: cart.cartCount > 0,
              ),
            ],
          )
        : Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your cart is empty',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                Image.asset("assets/images/empty-cart.png"),
              ],
            ),
          );
  }
}
