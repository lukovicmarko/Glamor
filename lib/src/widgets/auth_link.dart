import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';

class AuthLink extends StatelessWidget {
  AuthLink({this.text, this.linkText, this.onPress});

  final String text;
  final String linkText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            linkText,
            style: TextStyle(color: kRedColor),
          ),
        ),
      ],
    );
  }
}
