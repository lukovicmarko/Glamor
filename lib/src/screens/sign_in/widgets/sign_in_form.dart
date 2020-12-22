import 'package:flutter/material.dart';
import 'package:food/src/data/auth_data.dart';
import 'package:food/src/provider/spinner.dart';
import 'package:food/src/screens/sign_in/widgets/social_button.dart';
import 'package:food/src/screens/sign_up/sign_up_screen.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:provider/provider.dart';
import '../../main/main_screen.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String message;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthData>(context);
    var spinner = Provider.of<Spinner>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // TextFieldContainer(
          //   child: buildEmailFormField(),
          // ),
          // SizedBox(height: getProportionateScreenHeight(35)),
          // TextFieldContainer(
          //   child: buildPasswordFormField(),
          // ),
          SizedBox(height: getProportionateScreenHeight(45)),
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(70),
            // child: DefaultButton(
            //   text: "LOGIN",
            //   borderRadius: 15.0,
            //   onPress: () async {
            //     spinner.isActiveSpiner();

            //     await provider.login(email, password);

            //     if (provider.userInfo["message"] != null) {
            //       spinner.isInActiveSpiner();
            //       setState(() {
            //         message = provider.userInfo["message"];
            //       });
            //     } else {
            //       spinner.isInActiveSpiner();
            //       Navigator.pushNamed(context, MainScreen.routeName);
            //     }
            //   },
            // ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          message != null
              ? Text(
                  message,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: getProportionateScreenWidth(17),
                  ),
                )
              : Container(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: getProportionateScreenWidth(100.0),
                height: 1.0,
                // color: kTextColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('Or Sign in with'),
              ),
              Container(
                width: getProportionateScreenWidth(100.0),
                height: 1.0,
                // color: kTextColor,
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(image: "assets/icons/facebook.svg"),
              SizedBox(width: getProportionateScreenWidth(50.0)),
              SocialButton(image: "assets/icons/google.svg"),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(5)),
              // AuthLink(
              //   text: "SIGN UP",
              //   onPress: () {
              //     Navigator.pushNamed(context, SignUpScreen.routeName);
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          email = value;
        });
      },
      decoration: InputDecoration(
        hintText: "Email",
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {});
        }
        return null;
      },
      // decoration: InputDecoration(
      //   hintText: "Password",
      //   suffixIcon: CustomSurffixIcon(
      //     svgIcon: "assets/icons/hide.svg",
      //   ),
      // ),
    );
  }
}
