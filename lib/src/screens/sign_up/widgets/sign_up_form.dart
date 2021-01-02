import 'package:flutter/material.dart';
import 'package:food/src/data/auth_data.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/provider/spinner.dart';
import 'package:food/src/screens/main/main_screen.dart';
import 'package:food/src/screens/sign_in/sign_in_screen.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/auth_container.dart';
import 'package:food/src/widgets/auth_link.dart';
import 'package:food/src/widgets/default_button.dart';
import 'package:food/src/widgets/form_error.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final authData = new AuthData();
  final _formKey = GlobalKey<FormState>();

  String name;
  String email;
  String password;

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

  signUp() async {
    final spinner = Provider.of<Spinner>(context);
    final navigation = Provider.of<BottomNavigationBarProvider>(context);
    spinner.isActiveSpiner();

    await authData.register(name, email, password);

    if (authData.isLogged) {
      Navigator.pushNamed(context, MainScreen.routeName);
      spinner.isInActiveSpiner();
      navigation.currentIndex = 0;
    } else {
      spinner.isInActiveSpiner();
      addError(error: authData.message);
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
            vertical: getProportionateScreenHeight(40),
          ),
          child: Column(
            children: [
              buildNameField(),
              SizedBox(height: 20),
              buildEmailField(),
              SizedBox(height: 20),
              buildPasswordField(),
              SizedBox(height: 40),
              FormError(errors: errors),
              SizedBox(height: 25),
              DefaultButton(
                text: "Sign Up",
                onPress: () {
                  signUp();
                },
              ),
              SizedBox(height: 20),
              AuthLink(
                text: "Already have an account?",
                linkText: "Sign In",
                onPress: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        setState(() {
          name = value;
        });
        // if (value.isNotEmpty) {
        //   removeError(error: kEmailNullError);
        // } else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        // return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Name must not be empty";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Name',
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

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: true,
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
      ),
    );
  }
}
