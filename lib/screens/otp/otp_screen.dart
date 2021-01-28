import 'package:flutter/material.dart';

import 'components/otp_body.dart';

class OTPScreen extends StatelessWidget {
  static String routeName="/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: OtpBody(),
    );
  }
}
