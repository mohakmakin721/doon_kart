import 'package:doon_kart/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp phoneNumberValidator = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
final RegExp passwordValidator = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
final RegExp ageValidator = RegExp(r'^[0-9]{1,2}[:.,-]?$');
const String kEmailNullError = "Please Enter Your Email";
const String kEmailNotMatched = "Please enter the same email used to Log in";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter Your Password";
const String kShortPassError = "Minimum eight characters, \nAt least one uppercase letter, \nAt least one lowercase letter, \nAt least One number and \nAt least one special character:";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please enter your first name";
const String kLastNameNullError = "Please enter your last name";
const String kAgeNullError = "Please enter your age";
const String kAgeError = "Please enter valid age";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kPhoneNumberError = "Please enter valid phone number";
const String kShortPhoneNumberError = "Please Enter 10 digit phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: kTextColor));
}
