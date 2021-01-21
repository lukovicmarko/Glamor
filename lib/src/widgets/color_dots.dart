import 'package:flutter/material.dart';
import 'package:food/src/data/products_data.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:provider/provider.dart';

class ColorDots extends StatelessWidget {
  ColorDots({this.color, this.index, this.width, this.height});
  final String color;
  final int index;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final newColor = int.parse(color);
    var imageIndex = Provider.of<ProductsData>(context);
    return GestureDetector(
      onTap: () {
        imageIndex.imageIndex = index;
      },
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: imageIndex.imageIndex == index ? kRedColor : Color(newColor),
            width: 2,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(newColor),
          ),
        ),
      ),
    );
  }
}
