import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/default_button.dart';

class CheckoutButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      child: Row(
        children: [
          Expanded(
            child: DefaultButton(
              text: 'Cancel',
              color: kWhiteColor,
              textColor: kRedColor,
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: DefaultButton(
              text: 'Place Order',
              color: kRedColor,
              textColor: kWhiteColor,
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
