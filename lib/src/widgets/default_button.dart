import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({this.text, this.onPress});

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        color: kRedColor,
        onPressed: onPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Text(
          text,
          style: TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.w800,
            fontSize: getProportionateScreenWidth(15),
          ),
        ),
      ),
    );
  }
}
