import 'package:flutter/material.dart';
import 'package:food/src/screens/sign_in/widgets/sign_in_form.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.06),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: getProportionateScreenWidth(160),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.06),
            Text(
              'Hi, \nWelcome Back!',
              style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(22)),
            ),
            SizedBox(height: getProportionateScreenHeight(35)),
            SignForm(),
          ],
        ),
      ),
    );
  }
}
