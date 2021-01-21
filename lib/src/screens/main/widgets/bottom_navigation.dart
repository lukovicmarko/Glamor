import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/src/data/cart_data.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:food/src/utils/colors.dart';

buildBottomNavigationBar(provider) {
  return BottomNavigationBar(
    onTap: (int index) {
      provider.currentIndex = index;
    },
    currentIndex: provider.currentIndex,
    selectedItemColor: kRedColor,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/home.svg",
          width: 6.25.w,
          color: kGreyColor,
        ),
        title: Text("Home"),
        activeIcon: SvgPicture.asset(
          "assets/icons/home.svg",
          width: 6.25.w,
          color: kRedColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: Consumer<CartData>(
          builder: (context, cart, _) => Badge(
            badgeColor: kGreyColor,
            badgeContent: Text(
              cart.cartCount.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            animationType: BadgeAnimationType.scale,
            animationDuration: Duration(milliseconds: 200),
            child: SvgPicture.asset(
              "assets/icons/shopping-cart.svg",
              width: 6.25.w,
              color: kGreyColor,
            ),
          ),
        ),
        title: Text("Cart"),
        activeIcon: Consumer<CartData>(
          builder: (context, cart, _) => Badge(
            badgeColor: kGreyColor,
            badgeContent: Text(
              cart.cartCount.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            animationType: BadgeAnimationType.scale,
            animationDuration: Duration(milliseconds: 200),
            child: SvgPicture.asset(
              "assets/icons/shopping-cart.svg",
              width: 6.25.w,
              color: kRedColor,
            ),
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/heart.svg",
          width: 6.25.w,
          color: kGreyColor,
        ),
        title: Text("Favourites"),
        activeIcon: SvgPicture.asset(
          "assets/icons/heart.svg",
          width: 6.25.w,
          color: kRedColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/user.svg",
          width: 6.25.w,
          color: kGreyColor,
        ),
        title: Text("Profile"),
        activeIcon: SvgPicture.asset(
          "assets/icons/user.svg",
          width: 6.25.w,
          color: kRedColor,
        ),
      ),
    ],
  );
}
