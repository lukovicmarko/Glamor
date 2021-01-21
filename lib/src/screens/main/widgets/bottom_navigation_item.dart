import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/src/utils/colors.dart';
import 'package:sizer/sizer.dart';

BottomNavigationBarItem builBottomNavigationItem({String icon, String text}) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      icon,
      width: 6.25.w,
      color: kGreyColor,
    ),
    title: Text(
      text,
    ),
    activeIcon: SvgPicture.asset(
      icon,
      width: 6.25.w,
      color: kRedColor,
    ),
  );
}
