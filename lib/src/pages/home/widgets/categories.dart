import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: getProportionateScreenHeight(100),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: getProportionateScreenWidth(30)),
            child: Column(
              children: [
                Container(
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenWidth(50),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: _categories[index].color,
                      ),
                      borderRadius: BorderRadius.circular(18)),
                  child: Opacity(
                    opacity: .9,
                    child: SvgPicture.asset(
                      categories[index].image,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  _categories[index].name,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      color: kGreyColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
