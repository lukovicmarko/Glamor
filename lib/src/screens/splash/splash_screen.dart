import 'package:flutter/material.dart';
import 'package:food/src/provider/spinner.dart';
import 'package:food/src/screens/splash/widgets/body.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        child: Body(),
        inAsyncCall: Provider.of<Spinner>(context).showSpinner,
      ),
    );
  }
}
