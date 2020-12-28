import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/screens/main/widgets/bottom_navigation_item.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/constants.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  Body(this.provider);
  final BottomNavigationBarProvider provider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: provider.tabs[provider.currentIndex],
    );
  }
}
