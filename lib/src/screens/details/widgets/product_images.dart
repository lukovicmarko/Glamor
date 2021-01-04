import 'package:flutter/material.dart';
import 'package:food/src/data/products_data.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/build_dots.dart';
import 'package:provider/provider.dart';

class ProductImages extends StatefulWidget {
  ProductImages({@required this.product});
  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var imageIndex = Provider.of<ProductsData>(context).imageIndex;
    return Stack(
      children: [
        Container(
          color: kWhiteColor,
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * .33,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: widget.product.images[imageIndex].length,
            itemBuilder: (context, index) => Hero(
              tag: widget.product.name,
              child: Image.asset(
                widget.product.images[imageIndex][currentIndex],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: Row(
            children: List.generate(
              widget.product.images[imageIndex].length,
              (index) => buildDots(
                currentIndex: currentIndex,
                index: index,
                color: kRedColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
