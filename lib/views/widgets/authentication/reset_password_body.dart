import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../button_widget.dart';
import '../textfiled_widget.dart';

class ResetPasswordBody extends StatelessWidget {
  ResetPasswordBody({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset("assets/images/top_left_corner.png", width: 150),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_outlined))
              ],
            ),
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
                      "Reset Password",
                      style: mainTextStyleBoldBig.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Text(
                      "Don’t worry, we can help you get back on track with your account.",
                      style: mainTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Please Enter your email for reset password my friend",
                      style: mainTextStyleBold,
                    ),
                    const SizedBox(
                      height: 50,
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
                  ],
                ),
              ),
            ),
            ButtonWidget(onPress: () {}, text: "Reset Password"),
          ],
        ),
      ),
    );
  }
}
