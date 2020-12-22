import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';

class SocialButton extends StatelessWidget {
  SocialButton({this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: getProportionateScreenWidth(65),
        height: getProportionateScreenHeight(55),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: SvgPicture.asset(image),
          ),
        ),
      ),
    );
  }
}
