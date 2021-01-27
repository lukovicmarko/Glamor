import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/data/products_data.dart';
import 'package:food/src/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsData>(context);
    return TextField(
      onSubmitted: (value) {
        products.searchProducts(value);
      },
      style: TextStyle(fontSize: 2.2.h),
      decoration: InputDecoration(
        hintText: "Search Products",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kGreyColor, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kGreyColor, width: 1.0),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 2.2.h),
          child: SvgPicture.asset(
            "assets/icons/loupe.svg",
            width: 3.75.w,
            color: kGreyColor,
          ),
        ),
      ),
    );
  }
}
