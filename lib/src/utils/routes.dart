import 'package:flutter/material.dart';
import 'package:food/src/screens/details/details_screen.dart';
import 'package:food/src/screens/main/main_screen.dart';
import 'package:food/src/screens/sign_in/sign_in_screen.dart';
import 'package:food/src/screens/sign_up/sign_up_screen.dart';
import 'package:food/src/screens/splash/splash_screen.dart';

//We use name route
//All routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),  
};
