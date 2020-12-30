import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/data/auth_data.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/provider/spinner.dart';
import 'package:food/src/screens/sign_in/widgets/social_button.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/auth_container.dart';
import 'package:food/src/widgets/default_button.dart';
import 'package:food/src/widgets/form_error.dart';
import 'package:provider/provider.dart';
import '../../main/main_screen.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final authData = new AuthData();
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String message;
  bool _isPasswordVisible = false;

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  signIn() async {
    final spinner = Provider.of<Spinner>(context);
    final navigation = Provider.of<BottomNavigationBarProvider>(context);
    spinner.isActiveSpiner();

    await authData.login(email, password);

    if (authData.isLogged) {
      Navigator.pushNamed(context, MainScreen.routeName);
      spinner.isInActiveSpiner();
      navigation.currentIndex = 0;
    } else {
      spinner.isInActiveSpiner();
      addError(error: authData.message);
    }
  }

  signInWithGoogle() async {
    final navigation = Provider.of<BottomNavigationBarProvider>(context);
    await authData.loginWithGoogle();
    if (authData.isLogged) {
      Navigator.pushNamed(context, MainScreen.routeName);
      navigation.currentIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 10),
              FormError(errors: errors),
              SizedBox(height: 50),
              DefaultButton(
                text: "Sign In",
                onPress: () {
                  signIn();
                },
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
                    onPress: () {
                      signInWithGoogle();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: _isPasswordVisible,
      onSaved: (newValue) => password = newValue,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        setState(() {
          password = value;
        });
        // if (value.isNotEmpty) {
        //   removeError(error: kPassNullError);
        // } else if (value.length >= 6) {
        //   removeError(error: kShortPassError);
        // }
        // return null;
      },
      validator: (value) {
        // if (value.isEmpty) {
        //   addError(error: kPassNullError);
        //   return "";
        // } else if (value.length < 6) {
        //   addError(error: kShortPassError);
        //   return "";
        // }
        // return null;
      },
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
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        setState(() {
          email = value;
        });
        // if (value.isNotEmpty) {
        //   removeError(error: kEmailNullError);
        // } else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        // return null;
      },
      validator: (value) {
        // if (value.isEmpty) {
        //   addError(error: kEmailNullError);
        //   return "";
        // } else if (!emailValidatorRegExp.hasMatch(value)) {
        //   addError(error: kInvalidEmailError);
        //   return "";
        // }
        // return null;
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Email',
      ),
    );
  }
}
