import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/constants.dart';

class AuthContainer extends StatelessWidget {
  AuthContainer({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          kDefaultShadow,
        ],
      ),
      child: child,
    );
  }
}
