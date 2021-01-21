import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';
import 'package:sizer/sizer.dart';

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
          height: 39.0.h,
          width: 58.7.w,
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            color: kBlackColor,
            fontSize: 3.2.h,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 3.0.h),
        Text(
          subtitle,
          style: TextStyle(
            color: kBlackColor,
            fontSize: 2.5.h,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
