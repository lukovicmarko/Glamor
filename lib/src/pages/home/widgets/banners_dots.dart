import 'package:flutter/material.dart';
import 'package:food/src/data/banners_data.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/constants.dart';
import 'package:provider/provider.dart';

class BannersDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final banners = Provider.of<BannersData>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.banners.length,
            (index) => AnimatedContainer(
              duration: kAnimationDuration,
              margin: EdgeInsets.only(right: 5, top: 10),
              width: banners.currentIndex == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                // color: banners.currentIndex == index
                //     ? kOrangeColor
                //     : kOrangeColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
