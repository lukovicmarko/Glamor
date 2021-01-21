import 'package:flutter/material.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/utils/colors.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton({this.product});
  final Product product;

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
          // widget.product.isActive = !widget.product.isActive;
        });
      },
      child: isActive
          ? Icon(
              Icons.favorite,
              color: kRedColor,
            )
          : Icon(
              Icons.favorite_border,
              color: kRedColor,
            ),
    );
  }
}
