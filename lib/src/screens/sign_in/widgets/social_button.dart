import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';

class SocialButton extends StatelessWidget {
  SocialButton({this.image, this.text, this.onPress});
  final String image;
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: getProportionateScreenHeight(50),
        child: FlatButton(
          onPressed: onPress,
          child: Row(
            children: [
              SvgPicture.asset(image, width: getProportionateScreenWidth(14)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15)),
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: getProportionateScreenWidth(14),
                  ),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.grey[200], width: 1),
          ),
        ),
      ),
    );
  }
}
