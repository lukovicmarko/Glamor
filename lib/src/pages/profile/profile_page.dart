import 'package:flutter/material.dart';
import 'package:food/src/data/auth_data.dart';
import 'package:food/src/screens/sign_in/sign_in_screen.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final LocalStorage storage = LocalStorage('localstorage_app');

  logout() {}

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<AuthData>(context);
    return Center(
      child: GestureDetector(
        onTap: () {
          storage.deleteItem('token');
          authData.logoutWithGoogle();
          Navigator.pushNamed(context, SignInScreen.routeName);
        },
        child: Icon(Icons.close),
      ),
    );
  }
}
