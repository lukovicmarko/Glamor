import 'package:flutter/material.dart';
import 'package:food/src/data/cart_data.dart';
import 'package:food/src/data/products_data.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/screens/details/details_screen.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/constants.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatelessWidget {
  CartProduct({this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartData>(context);
    var imageIndex = Provider.of<ProductsData>(context);
    return Dismissible(
      key: ValueKey(product.id),
      background: Container(
        child: Icon(
          Icons.delete,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 30.0),
      ),
      onDismissed: (direction) {
        cart.removeFromCart(product);
      },
      child: Container(
        width: double.infinity,
        height: 140,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            kDefaultShadow,
          ],
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DetailsScreen.routeName,
                  arguments: ProductDetailsArguments(
                    product: product,
                  ),
                );
              },
              child: Image.asset(
                product.images[imageIndex.imageIndex][0],
                width: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toString()}',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        children: [
                          CartProductButton(
                            icon: Icons.remove,
                            onPress: () {
                              cart.decrementProductTotal(product);
                            },
                          ),
                          Container(
                            width: 40,
                            padding: EdgeInsets.symmetric(vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: kGreyColor,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child:
                                Center(child: Text(product.total.toString())),
                          ),
                          CartProductButton(
                            icon: Icons.add,
                            onPress: () {
                              cart.incrementProductTotal(product);
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartProductButton extends StatelessWidget {
  CartProductButton({this.onPress, this.icon});

  final Function onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        icon,
        color: kRedColor,
      ),
    );
  }
}
