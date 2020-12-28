import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/src/utils/colors.dart';

BottomNavigationBarItem builBottomNavigationItem({String icon, String text}) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      icon,
      width: 25,
      color: kGreyColor,
    ),
    title: Text(
      text,
    ),
    activeIcon: SvgPicture.asset(
      icon,
      width: 25,
      color: kRedColor,
    ),
  );
}
