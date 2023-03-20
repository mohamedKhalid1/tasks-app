import 'package:flutter/material.dart';

import '../../widgets/authentication/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);
  static const String routeName = "resetPasswordScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResetPasswordBody(),
      ),
    );
  }
}
