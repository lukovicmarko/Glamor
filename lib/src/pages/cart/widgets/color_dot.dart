import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';

class ColorDot extends StatelessWidget {
  ColorDot({this.color});
  final String color;
  @override
  Widget build(BuildContext context) {
    final newColor = int.parse(color);
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: kRedColor,
          width: 2,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(newColor),
        ),
      ),
    );
  }
}
