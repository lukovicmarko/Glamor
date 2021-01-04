import 'package:flutter/material.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/screens/details/widgets/body.dart';
import 'package:food/src/widgets/rounded_icon_button.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: RoundedIconButton(
          iconData: Icons.arrow_back_ios,
          onPress: () => Navigator.pop(context),
        ),
      ),
      body: Body(product: agrs.product),
    );
  }
}

//But we also need to pass our product to our details screen
//And we use name route so we need to create a arguments class

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
