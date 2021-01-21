import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/src/data/auth_data.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/provider/spinner.dart';
import 'package:food/src/screens/sign_in/widgets/social_button.dart';
import 'package:food/src/screens/sign_up/sign_up_screen.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/widgets/auth_container.dart';
import 'package:food/src/widgets/auth_link.dart';
import 'package:food/src/widgets/default_button.dart';
import 'package:food/src/widgets/form_error.dart';
import 'package:provider/provider.dart';
import '../../main/main_screen.dart';
import 'package:sizer/sizer.dart';

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
            horizontal: 3.7.w,
            vertical: 5.8.h,
          ),
          child: Column(
            children: [
              buildEmailField(),
              SizedBox(height: 2.9.h),
              buildPasswordField(),
              SizedBox(height: 2.9.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?'),
                ],
              ),
              SizedBox(height: 1.5.h),
              FormError(errors: errors),
              SizedBox(height: 3.6.h),
              DefaultButton(
                text: "Sign In",
                color: kRedColor,
                textColor: kWhiteColor,
                onPress: () {
                  signIn();
                },
              ),
              SizedBox(height: 2.9.h),
              AuthLink(
                text: "Don't have an account?",
                linkText: "Sign Up",
                onPress: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
              ),
              SizedBox(height: 1.5.h),
              Text('-OR-'),
              SizedBox(height: 2.9.h),
              Row(
                children: [
                  SocialButton(
                    text: "Facebook",
                    image: "assets/icons/facebook.svg",
                    onPress: () {},
                  ),
                  SizedBox(width: 3.2.w),
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
            padding: EdgeInsets.symmetric(horizontal: 4.0.w),
            child: SvgPicture.asset(
              "assets/icons/eye.svg",
              height: 2.2.h,
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
