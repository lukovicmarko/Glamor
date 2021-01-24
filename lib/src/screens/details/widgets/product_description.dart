import 'package:flutter/material.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/color_dots.dart';

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
                (index) => ColorDots(
                  product: product,
                  color: product.colors[index],
                  index: index,
                  width: 35,
                  height: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
