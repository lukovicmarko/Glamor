import 'package:flutter/material.dart';
import 'package:food/src/pages/cart/cart_page.dart';
import 'package:food/src/pages/favourites/favourites_page.dart';
import 'package:food/src/pages/home/home_page.dart';
import 'package:food/src/pages/products/products_page.dart';
import 'package:food/src/pages/profile/profile_page.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  final tabs = [
    HomePage(),
    CartPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;

    notifyListeners();
  }
}
