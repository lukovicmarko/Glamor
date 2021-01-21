import 'package:flutter/material.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/screens/details/widgets/favorite_button.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';

class ProductName extends StatelessWidget {
  ProductName({@required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price.toString()}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: kYellowColor,
                      ),
                      Text(product.rating.toString()),
                    ],
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                  FavoriteButton(product: product),
                ],
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Text(product.name),
        ],
      ),
    );
  }
}
