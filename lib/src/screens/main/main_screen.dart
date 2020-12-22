import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/utils/colors.dart';
// import 'package:food/src/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class MainScreen extends StatelessWidget {
  static String routeName = "/main";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: SafeArea(child: provider.tabs[provider.currentIndex]),
      // bottomNavigationBar: buildBottomNavigationBar(provider),
      floatingActionButton: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          // color: kOrangeColor,
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/icons/shopping-bag.svg",
                color: kWhiteColor,
                width: 30.0,
              ),
            ),
            Positioned(
              top: 20.0,
              right: 8.0,
              child: Badge(
                badgeColor: kWhiteColor,
                badgeContent: Text(
                  '2',
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                animationType: BadgeAnimationType.scale,
                animationDuration: Duration(milliseconds: 200),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
