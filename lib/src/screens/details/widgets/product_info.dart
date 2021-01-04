import 'package:flutter/material.dart';
import 'package:food/src/data/products_data.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/screens/details/widgets/product_description.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:provider/provider.dart';

class ProductInfo extends StatefulWidget {
  ProductInfo({this.product});
  final Product product;

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int currentIndex = 0;

  final List<String> descriptions = ['Product', 'Description', 'Reviews'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                descriptions.length, (index) => buildDescription(index)),
          ],
        ),
        ProductDescription(product: widget.product),
      ],
    );
  }

  GestureDetector buildDescription(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(8),
        ),
        decoration: BoxDecoration(
          color: currentIndex == index ? kRedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          descriptions[index],
          style: TextStyle(
            color: currentIndex == index ? kWhiteColor : kBlackColor,
          ),
        ),
      ),
    );
  }
}
