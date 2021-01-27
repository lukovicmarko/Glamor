import 'package:flutter/material.dart';
import 'package:food/src/data/auth_data.dart';
import 'package:food/src/utils/colors.dart';
import 'package:provider/provider.dart';

class ProfilePageImage extends StatefulWidget {
  @override
  _ProfilePageImageState createState() => _ProfilePageImageState();
}

class _ProfilePageImageState extends State<ProfilePageImage> {
  var authData = new AuthData();

  @override
  void initState() {
    authData.getUserFromLocalStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: authData.user.image.contains('https')
                  ? NetworkImage(authData.user.image)
                  : AssetImage(authData.user.image),
            ),
            SizedBox(width: 20),
            Text(
              authData.user.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: kWhiteColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
