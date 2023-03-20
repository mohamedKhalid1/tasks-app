import 'package:flutter/material.dart';
import 'package:tasks_app/views/widgets/authentication/signin_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const String routeName = "signInScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SignInBody(),
      ),
    );
  }
}
