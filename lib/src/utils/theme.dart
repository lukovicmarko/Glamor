import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';

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
