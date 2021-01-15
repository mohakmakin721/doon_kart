import 'file:///D:/Mohak/Android%20Project/doon_kart/lib/screens/splash/splash_screen.dart';
import 'package:doon_kart/screens/forgot_password/forgot_password_screen.dart';
import 'package:doon_kart/screens/login_success/login_success_screen.dart';
import 'package:doon_kart/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes ={
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context)=> SignInScreen(),
  ForgotPasswordScreen.routeName: (context)=> ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context)=> LoginSuccessScreen(),
};