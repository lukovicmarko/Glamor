import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: getProportionateScreenWidth(15),
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kGreyColor, width: 1.0),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SvgPicture.asset(
            "assets/icons/loupe.svg",
            width: getProportionateScreenWidth(15),
            color: kGreyColor,
          ),
        ),
      ),
    );
  }
}
