import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/pages/home/widgets/banners.dart';
import 'package:food/src/pages/home/widgets/categories.dart';
import 'package:food/src/pages/home/widgets/products.dart';
import 'package:food/src/pages/home/widgets/search_bar.dart';
import 'package:food/src/utils/colors.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(3.75.w),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(),
            SizedBox(height: 2.2.h),
            Banners(),
            Categories(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Products",
                  style:
                      TextStyle(fontSize: 3.25.h, fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Text('All'),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 2.2.h,
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
