import 'package:flutter/material.dart';
import 'package:food/src/screens/main/widgets/body.dart';

class MainScreen extends StatelessWidget {
  static String routeName = "/main";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      // SafeArea(child: provider.tabs[provider.currentIndex]),
      // bottomNavigationBar: buildBottomNavigationBar(provider),
    );
  }
}
