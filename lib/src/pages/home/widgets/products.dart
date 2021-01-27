import 'package:flutter/material.dart';
import 'package:food/src/data/products_data.dart';
import 'package:food/src/screens/details/details_screen.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/product_card.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsData>(
      builder: (context, products, child) => Container(
        height: getProportionateScreenWidth(240),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.topProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: products.topProducts[index],
              onPress: () {
                products.imageIndex = 0;
                products.topProducts[index].colorIndex = 0;
                products.topProducts[index].total = 1;
                Navigator.pushNamed(
                  context,
                  DetailsScreen.routeName,
                  arguments: ProductDetailsArguments(
                    product: products.topProducts[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
