import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';
import 'package:sizer/sizer.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: 'Montserrat',
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    labelStyle: TextStyle(color: kBlackColor),
    contentPadding: EdgeInsets.only(top: 5),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[200]),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[200]),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kBlackColor, fontSize: 2.35.h),
    bodyText2: TextStyle(color: kBlackColor, fontSize: 2.35.h),
    headline1: TextStyle(color: kBlackColor, fontSize: 2.35.h),
    headline6: TextStyle(color: kBlackColor, fontSize: 2.35.h),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: kWhiteColor,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
