import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/screens/main/widgets/bottom_navigation_item.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/constants.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Stack(
      children: [
        provider.tabs[provider.currentIndex],
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: SizeConfig.screenWidth,
            height: 80,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                kDefaultShadow,
              ],
            ),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  width: SizeConfig.screenWidth,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      bottomNavigationData.length,
                      (index) => BottomNavigationItem(
                        icon: bottomNavigationData[index]["icon"],
                        text: bottomNavigationData[index]["text"],
                        index: index,
                        onPress: () {
                          provider.currentIndex = index;
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
