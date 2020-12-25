import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/src/utils/colors.dart';

buildBottomNavigationBar(provider) {
  return BottomNavigationBar(
    onTap: (int index) {
      provider.currentIndex = index;
    },
    currentIndex: provider.currentIndex,
    selectedItemColor: kRedColor,
    type: BottomNavigationBarType.fixed,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/home.svg",
          width: 25,
          color: kGreyColor,
        ),
        title: Text(
          'Home',
        ),
        activeIcon: SvgPicture.asset(
          "assets/icons/home.svg",
          width: 25,
          color: kRedColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/shopping-cart.svg",
          width: 25,
          color: kGreyColor,
        ),
        title: Text('Cart'),
        activeIcon: SvgPicture.asset(
          "assets/icons/shopping-cart.svg",
          width: 25,
          color: kRedColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/heart.svg",
          width: 25,
          color: kGreyColor,
        ),
        title: Text('Favourite'),
        activeIcon: SvgPicture.asset(
          "assets/icons/heart.svg",
          width: 25,
          color: kRedColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/user.svg",
          width: 25,
          color: kGreyColor,
        ),
        title: Text('Home'),
        activeIcon: SvgPicture.asset(
          "assets/icons/user.svg",
          width: 25,
          color: kRedColor,
        ),
      ),
    ],
  );
}
