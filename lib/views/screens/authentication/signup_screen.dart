import 'package:flutter/material.dart';
import 'package:tasks_app/views/widgets/authentication/signup_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = "signupScreen";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SignUpBody(),
      ),
    );
  }
}
