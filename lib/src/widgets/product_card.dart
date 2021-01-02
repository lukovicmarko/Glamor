import 'package:flutter/material.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/constants.dart';
import 'package:food/src/utils/size_config.dart';

class ProductCard extends StatelessWidget {
  ProductCard({this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2, 5, 10, 5),
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            kDefaultShadow,
          ],
        ),
        width: getProportionateScreenWidth(140),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding / 2),
          vertical: getProportionateScreenWidth(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: getProportionateScreenHeight(140),
                  child: Image.asset(
                    product.images[0],
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(12)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
                  child: Text(
                    product.name,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                    ),
                  ),
                ),
                Text(
                  '\$${product.price.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
