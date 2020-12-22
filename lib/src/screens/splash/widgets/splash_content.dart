import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';

class SplashContent extends StatelessWidget {
  SplashContent({this.title, this.subtitle, this.image});

  final String title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            color: kBlackColor,
            fontSize: getProportionateScreenWidth(22),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: kBlackColor,
            fontSize: getProportionateScreenWidth(17),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
