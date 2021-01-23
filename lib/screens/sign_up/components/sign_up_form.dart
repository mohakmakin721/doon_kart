import 'package:doon_kart/components/authentication_service.dart';
import 'package:doon_kart/components/custom_suffix_icon.dart';
import 'package:doon_kart/components/default_button.dart';
import 'package:doon_kart/components/form_error.dart';
import 'package:doon_kart/screens/complete_profile/complete_profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../contents.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential user;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          buildConfPasswordFormField(),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenWidth(40),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                // Go to profile page
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Creating Account'),
                    duration: Duration(seconds: 3)));
                context
                    .read<AuthenticationService>()
                    .signUp(
                        email: emailController.text,
                        password: passwordController.text)
                    .then((value) {
                  if (value == "Signed Up") {
                    Navigator.pushNamed(
                        context, CompleteProfileScreen.routeName);
                  }else{
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Login Failed - ' + value),
                        duration: Duration(seconds: 4)));
                  }
                }).catchError((onError) {
                  print(onError);
                  // Find the Scaffold in the widget tree and use it to show a SnackBar.
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Login Failed - ' + onError),
                      duration: Duration(seconds: 4)));
                });
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        confirmPassword=value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (password != value) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (passwordValidator.hasMatch(value)) {
          removeError(error: kShortPassError);
        }
        password=value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (!passwordValidator.hasMatch(value)) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter Your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
