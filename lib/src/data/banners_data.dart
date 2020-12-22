import 'package:flutter/material.dart';

class BannersData extends ChangeNotifier {
  int _currentIndex = 0;

  final List<String> _banners = [
    "assets/images/banner_1.jpg",
    "assets/images/banner_2.jpg",
    "assets/images/banner_3.jpg",
  ];

  get currentIndex => _currentIndex;
  get banners => _banners;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
