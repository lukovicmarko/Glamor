import 'package:flutter/material.dart';
import 'package:food/src/pages/home/widgets/banners_dots.dart';
import 'package:food/src/pages/home/widgets/categories.dart';
import 'package:food/src/pages/home/widgets/search_bar.dart';
import '../../utils/size_config.dart';
import './widgets/app_bar.dart';
import './widgets/banners.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
      ),
      child: Column(
        children: [
          buildAppBar(context),
          SearchBar(),
          Categories(),
          Expanded(
            child: ListView(
              children: [
                Banners(),
                BannersDots(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
