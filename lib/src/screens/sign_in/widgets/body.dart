import 'package:flutter/material.dart';
import 'package:food/src/screens/sign_in/widgets/sign_in_form.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/auth_parrent.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AuthParrent(
      title: 'Welcome Back',
      subTitle: 'Sign up to continue',
      child: SignForm(),
    );
  }
}
