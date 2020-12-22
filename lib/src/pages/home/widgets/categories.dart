import 'package:flutter/material.dart';
import 'package:food/src/data/categories_data.dart';
import 'package:food/src/models/Category.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/constants.dart';
import '../../../utils/size_config.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  final List<Category> _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: getProportionateScreenHeight(33),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: kAnimationDuration,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              right: kDefaultPadding,
            ),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              // color: index == selectedIndex ? kOrangeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Text(
              _categories[index].name,
              style: TextStyle(
                color: index == selectedIndex ? kWhiteColor : kGreyColor,
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
