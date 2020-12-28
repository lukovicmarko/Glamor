import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';

const kDefaultPadding = 20.0;

// our default Shadow
var kDefaultShadow = BoxShadow(
  color: kLightGrey,
  spreadRadius: 1,
  blurRadius: 5,
  offset: Offset(0, 1),
);

const kAnimationDuration = Duration(milliseconds: 200);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
