import 'package:flutter/material.dart';
import 'package:food/src/widgets/rounded_icon_button.dart';

buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: RoundedIconButton(
      iconData: Icons.arrow_back_ios,
      onPress: () => Navigator.pop(context),
    ),
  );
}
