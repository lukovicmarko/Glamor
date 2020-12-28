import 'package:flutter/material.dart';
import 'package:food/src/screens/main/widgets/bottom_navigation_item.dart';
import 'package:food/src/utils/colors.dart';

List<Map<String, String>> bottomNavigationData = [
  {
    "icon": "assets/icons/home.svg",
    "text": "Home",
  },
  {
    "icon": "assets/icons/shopping-cart.svg",
    "text": "Cart",
  },
  {
    "icon": "assets/icons/heart.svg",
    "text": "Favorites",
  },
  {
    "icon": "assets/icons/user.svg",
    "text": "Profile",
  },
];

buildBottomNavigationBar(provider) {
  return BottomNavigationBar(
    onTap: (int index) {
      provider.currentIndex = index;
    },
    currentIndex: provider.currentIndex,
    selectedItemColor: kRedColor,
    type: BottomNavigationBarType.fixed,
    items: List.generate(
      bottomNavigationData.length,
      (index) => builBottomNavigationItem(
          icon: bottomNavigationData[index]['icon'],
          text: bottomNavigationData[index]['text']),
    ),
  );
}
