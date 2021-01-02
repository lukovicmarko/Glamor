import 'package:flutter/material.dart';
import 'package:food/src/provider/spinner.dart';
import 'package:food/src/screens/sign_up/widgets/body.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        child: Center(
          child: SingleChildScrollView(
            child: Body(),
          ),
        ),
        inAsyncCall: Provider.of<Spinner>(context).showSpinner,
      ),
    );
  }
}
