import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/pages/home/widgets/banners.dart';
import 'package:food/src/pages/home/widgets/categories.dart';
import 'package:food/src/pages/home/widgets/products.dart';
import 'package:food/src/pages/home/widgets/search_bar.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(),
            SizedBox(height: getProportionateScreenHeight(15)),
            Banners(),
            Categories(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Products",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Text('All'),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(2)),
                      child: SvgPicture.asset(
                        "assets/icons/arrow-point-to-right.svg",
                        width: 12,
                        color: kRedColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Products(),
          ],
        ),
      ),
    );
  }
}
