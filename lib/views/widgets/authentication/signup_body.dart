import 'package:flutter/material.dart';
import 'package:tasks_app/views/screens/authentication/signin_screen.dart';

import '../../../utils/constants.dart';
import '../button_widget.dart';
import '../textfiled_widget.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/top_left_corner.png", width: 150),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 200,
                      height: 100,
                    ),
                    Text(
                      "Sign Up",
                      style: mainTextStyleBoldBig.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Name",
                        textAlign: TextAlign.left,
                        style: mainTextStyleBold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFieldInput(
                      textEditingController: nameController,
                      hintText: 'Enter your Name',
                      textInputType: TextInputType.emailAddress,
                      validate: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Email Address",
                        textAlign: TextAlign.left,
                        style: mainTextStyleBold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFieldInput(
                      textEditingController: emailController,
                      hintText: 'Enter your email',
                      textInputType: TextInputType.emailAddress,
                      validate: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Password",
                          textAlign: TextAlign.left,
                          style: mainTextStyleBold,
                        ),
                      ),
                    ),
                    TextFieldInput(
                      textEditingController: passwordController,
                      hintText: 'Enter your password',
                      textInputType: TextInputType.visiblePassword,
                      validate: () {},
                    ),
                  ],
                ),
              ),
            ),
            ButtonWidget(onPress: () {}, text: "Sign Up"),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.17),
              child: Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: mainTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                    child: Text(
                      "Sign In",
                      style: mainTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
