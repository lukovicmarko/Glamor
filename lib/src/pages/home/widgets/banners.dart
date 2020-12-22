import 'package:flutter/material.dart';
import '../../../utils/size_config.dart';
import 'package:provider/provider.dart';
import '../../../data/banners_data.dart';

class Banners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(120),
      child: Consumer<BannersData>(
        builder: (context, banners, child) => PageView.builder(
          onPageChanged: (value) {
            banners.currentIndex = value;
          },
          itemCount: banners.banners.length,
          itemBuilder: (context, index) => SizedBox(
            width: SizeConfig.screenWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                banners.banners[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
