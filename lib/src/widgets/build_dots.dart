import 'package:flutter/material.dart';
import 'package:food/src/utils/constants.dart';
import 'package:sizer/sizer.dart';

AnimatedContainer buildDots({int currentIndex, int index, Color color}) {
  return AnimatedContainer(
    duration: kAnimationDuration,
    margin: EdgeInsets.symmetric(horizontal: 1.25.w),
    width: currentIndex == index ? 5.0.w : 2.5.w,
    height: .9.h,
    decoration: BoxDecoration(
      color: currentIndex == index ? color : color.withOpacity(0.3),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
