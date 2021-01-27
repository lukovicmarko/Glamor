import 'package:flutter/material.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';

class Body extends StatelessWidget {
  Body(this.provider);
  final BottomNavigationBarProvider provider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: provider.tabs[provider.currentIndex],
    );
  }
}
