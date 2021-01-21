import 'package:flutter/material.dart';
import 'package:food/src/data/auth_data.dart';
import 'package:food/src/pages/profile/widgets/profile_page_background.dart';
import 'package:food/src/pages/profile/widgets/profile_page_image.dart';
import 'package:food/src/screens/sign_in/sign_in_screen.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/default_button.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final LocalStorage storage = LocalStorage('localstorage_app');

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<AuthData>(context);
    return Stack(
      children: [
        ProfilePageBackground(),
        ProfilePageImage(),
        Positioned(
          bottom: 10,
          child: Container(
            width: SizeConfig.screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: DefaultButton(
              text: 'Logout',
              color: kRedColor,
              textColor: kWhiteColor,
              onPress: () {
                storage.deleteItem('token');
                authData.logoutWithGoogle();
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
            ),
          ),
        ),
      ],
    );
  }
}
