import 'package:flutter/material.dart';
import 'package:food/src/utils/size_config.dart';

class AuthParrent extends StatelessWidget {
  AuthParrent({this.title, this.subTitle, this.child});

  final String title;
  final String subTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(22),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Container(child: child)
          ],
        ),
      ),
    );
  }
}
