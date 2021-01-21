import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:food/src/widgets/build_dots.dart';

class Banners extends StatefulWidget {
  @override
  _BannersState createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  int currentIndex = 0;

  final List<String> _banners = [
    "assets/images/banner_1.jpg",
    "assets/images/banner_2.jpg",
    "assets/images/banner_3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 22.0.h,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: _banners.length,
            itemBuilder: (context, index) => SizedBox(
              width: 100.0.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  _banners[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 1.5.h,
          left: 100.0.w * .5 - 12.5.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _banners.length,
              (index) => buildDots(
                currentIndex: currentIndex,
                index: index,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
