import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/data/auth_data.dart';
import 'package:food/src/provider/spinner.dart';
import 'package:food/src/screens/sign_in/widgets/social_button.dart';
import 'package:food/src/screens/sign_up/sign_up_screen.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/auth_container.dart';
import 'package:food/src/widgets/default_button.dart';
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
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthData>(context);
    var spinner = Provider.of<Spinner>(context);
    return AuthContainer(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenHeight(40)),
          child: Column(
            children: [
              buildEmailField(),
              SizedBox(height: 20),
              buildPasswordField(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              DefaultButton(
                text: "Sign In",
                onPress: () {},
              ),
              SizedBox(height: 20),
              Text('-OR-'),
              SizedBox(height: 20),
              Row(
                children: [
                  SocialButton(
                    text: "Facebook",
                    image: "assets/icons/facebook.svg",
                    onPress: () {},
                  ),
                  SizedBox(width: getProportionateScreenWidth(13)),
                  SocialButton(
                    text: "Google",
                    image: "assets/icons/google.svg",
                    onPress: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //   key: _formKey,
      //   child: Column(
      //     children: [
      // TextFieldContainer(
      //   child: buildEmailFormField(),
      // ),
      // SizedBox(height: getProportionateScreenHeight(35)),
      // TextFieldContainer(
      //   child: buildPasswordFormField(),
      // ),
      // SizedBox(height: getProportionateScreenHeight(45)),
      // SizedBox(
      //   width: double.infinity,
      //   height: getProportionateScreenHeight(70),
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
      //   ),
      //   SizedBox(
      //     height: getProportionateScreenHeight(20),
      //   ),
      //   message != null
      //       ? Text(
      //           message,
      //           style: TextStyle(
      //             color: Colors.red,
      //             fontSize: getProportionateScreenWidth(17),
      //           ),
      //         )
      //       : Container(),
      //   SizedBox(
      //     height: getProportionateScreenHeight(20),
      //   ),
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         width: getProportionateScreenWidth(100.0),
      //         height: 1.0,
      //         // color: kTextColor,
      //       ),
      //       Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 10.0),
      //         child: Text('Or Sign in with'),
      //       ),
      //       Container(
      //         width: getProportionateScreenWidth(100.0),
      //         height: 1.0,
      //         // color: kTextColor,
      //       ),
      //     ],
      //   ),
      //   SizedBox(
      //     height: getProportionateScreenHeight(40),
      //   ),
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SocialButton(image: "assets/icons/facebook.svg"),
      //       SizedBox(width: getProportionateScreenWidth(50.0)),
      //       SocialButton(image: "assets/icons/google.svg"),
      //     ],
      //   ),
      //   SizedBox(height: getProportionateScreenHeight(30)),
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         "Don't have an account?",
      //         style: TextStyle(
      //           fontSize: getProportionateScreenWidth(16),
      //         ),
      //       ),
      //       SizedBox(width: getProportionateScreenWidth(5)),
      //       // AuthLink(
      //       //   text: "SIGN UP",
      //       //   onPress: () {
      //       //     Navigator.pushNamed(context, SignUpScreen.routeName);
      //       //   },
      //       // ),
      //     ],
      //   ),
      //     ],
      //   ),
      // ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: _isPasswordVisible,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(12)),
            child: SvgPicture.asset(
              "assets/icons/eye.svg",
              height: getProportionateScreenWidth(15),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Email',
      ),
    );
  }
}
