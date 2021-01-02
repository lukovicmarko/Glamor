import 'package:flutter/material.dart';
import 'package:food/src/pages/home/widgets/banners.dart';
import 'package:food/src/pages/home/widgets/categories.dart';
import 'package:food/src/pages/home/widgets/search_bar.dart';
import 'package:food/src/utils/size_config.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Column(
          children: [
            SearchBar(),
            SizedBox(height: getProportionateScreenHeight(15)),
            Banners(),
            Categories(),
          ],
        ),
      ),
    );
  }
}
