import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';
import 'package:sizer/sizer.dart';

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
        Text(
          text,
          style: TextStyle(fontSize: 2.2.h),
        ),
        SizedBox(
          width: 1.25.w,
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
