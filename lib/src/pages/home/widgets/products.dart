import 'package:flutter/material.dart';
import 'package:food/src/data/products_data.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/constants.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/product_card.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsData>(
      builder: (context, products, child) => Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.topProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products.topProducts[index]);
          },
        ),
      ),
    );
  }
}
