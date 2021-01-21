import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
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
        height: 7.35.h,
        child: FlatButton(
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(image, width: 3.5.w),
              SizedBox(width: 2.5.w),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 2.0.h,
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
