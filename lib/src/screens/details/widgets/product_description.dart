import 'package:flutter/material.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/screens/details/widgets/color_dots.dart';
import 'package:food/src/utils/size_config.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription({this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Color'),
          SizedBox(height: 10),
          Row(
            children: [
              ...List.generate(
                product.colors.length,
                (index) =>
                    ColorDots(color: product.colors[index], index: index),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
