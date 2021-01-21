import 'package:doon_kart/components/authentication_service.dart';
import 'package:doon_kart/components/custom_suffix_icon.dart';
import 'package:doon_kart/components/default_button.dart';
import 'package:doon_kart/screens/login_success/login_success_screen.dart';
import 'package:doon_kart/routs.dart';

import 'package:doon_kart/screens/forgot_password/forgot_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../contents.dart';
import '../../../size_config.dart';
import '../../../components/form_error.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  String email;
  String password;
  bool remember = false;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential user;

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildPasswordFormField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    onChanged: (value) {
                      setState(() {
                        remember = value;
                      });
                    }),
                Text("Remember Me"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: Text(
                    "Forget Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
                firebaseAuth
                    .signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim())
                    .then((result) {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.pushNamedAndRemoveUntil(
                        context,
                        LoginSuccessScreen.routeName,
                        (Route<dynamic> route) => false);
                  }
                }).catchError((onError) {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.pushNamedAndRemoveUntil(
                        context,
                        LoginSuccessScreen.routeName,
                        (Route<dynamic> route) => false);
                  }
                });
              },
            )
          ],
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        if (firebaseAuth.currentUser != null) {
          removeError(error: "Check your Email/Password");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        } else if (firebaseAuth.currentUser == null) {
          addError(error: "Check your Email/Password");
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
        if (firebaseAuth.currentUser != null) {
          removeError(error: "Check your Email/Password");
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
        } else if (firebaseAuth.currentUser == null) {
          addError(error: "Check your Email/Password");
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
