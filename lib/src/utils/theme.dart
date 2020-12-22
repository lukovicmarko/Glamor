import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: 'NunitoSans',
    scaffoldBackgroundColor: kWhiteColor,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    border: InputBorder.none,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kBlackColor, fontSize: 16.0),
    bodyText2: TextStyle(color: kBlackColor, fontSize: 16.0),
    headline1: TextStyle(color: kBlackColor, fontSize: 18.0),
    headline6: TextStyle(color: kBlackColor, fontSize: 18.0),
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
