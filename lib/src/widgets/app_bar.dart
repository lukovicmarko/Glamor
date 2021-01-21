import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/data/cart_data.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/widgets/rounded_icon_button.dart';
import 'package:provider/provider.dart';

buildAppBar(BuildContext context) {
  final provider = Provider.of<BottomNavigationBarProvider>(context);
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: RoundedIconButton(
      iconData: Icons.arrow_back_ios,
      onPress: () => Navigator.pop(context),
    ),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
          provider.currentIndex = 1;
        },
        child: Consumer<CartData>(
          builder: (context, cart, _) => Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Badge(
              badgeColor: kGreyColor,
              badgeContent: Text(
                cart.cartCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              animationType: BadgeAnimationType.scale,
              animationDuration: Duration(milliseconds: 200),
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                  "assets/icons/shopping-cart.svg",
                  width: 28,
                  color: kRedColor,
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(width: 15.0)
    ],
  );
}
