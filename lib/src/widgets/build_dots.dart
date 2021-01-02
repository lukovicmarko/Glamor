import 'package:flutter/material.dart';
import 'package:food/src/utils/constants.dart';

AnimatedContainer buildDots({int currentIndex, int index, Color color}) {
  return AnimatedContainer(
    duration: kAnimationDuration,
    margin: EdgeInsets.symmetric(horizontal: 5),
    width: currentIndex == index ? 20 : 10,
    height: 6,
    decoration: BoxDecoration(
      color: currentIndex == index ? color : color.withOpacity(0.3),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
