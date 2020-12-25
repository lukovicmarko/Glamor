import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:provider/provider.dart';

class BottomNavigationItem extends StatelessWidget {
  BottomNavigationItem({this.icon, this.text, this.onPress, this.index});

  final String icon;
  final String text;
  final Function onPress;
  final int index;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: getProportionateScreenWidth(80),
        height: getProportionateScreenHeight(80),
        color: kBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 25,
              color: provider.currentIndex == index ? kRedColor : kGreyColor,
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: provider.currentIndex == index ? kRedColor : kGreyColor,
                fontWeight: provider.currentIndex == index
                    ? FontWeight.w500
                    : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
