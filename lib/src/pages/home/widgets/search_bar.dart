import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/constants.dart';
import '../../../utils/size_config.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(55),
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: <BoxShadow>[kDefaultShadow],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15)),
            child: SvgPicture.asset(
              "assets/icons/loupe.svg",
              width: getProportionateScreenWidth(20),
              // color: kTextColor,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(bottom: getProportionateScreenWidth(3)),
                hintText: 'Search',
                // hintStyle: TextStyle(color: kTextColor),
              ),
              onChanged: (value) {},
            ),
          ),
          Container(
            height: getProportionateScreenHeight(45),
            width: getProportionateScreenWidth(45),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: kOrangeColor,
            ),
            padding: EdgeInsets.all(9.0),
            margin: EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              "assets/icons/sort.svg",
              width: getProportionateScreenWidth(22),
              color: kWhiteColor,
            ),
          )
        ],
      ),
    );
  }
}
