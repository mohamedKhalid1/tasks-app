import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/views/screens/authentication/signin_screen.dart';

import '../../../controllers/cubit/reset_password/reset_password_cubit.dart';
import '../../../utils/constants.dart';
import '../button_widget.dart';
import '../textfiled_widget.dart';

class ResetPasswordBody extends StatelessWidget {
  ResetPasswordBody({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          getSnackBar(context, state.error, Colors.red);
        }
        if (state is ResetPasswordSuccess) {
          Navigator.of(context).pushNamed(SignInScreen.routeName);
          getSnackBar(
              context,
              "link to reset password send to email successfully",
              Colors.green);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.2,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset("assets/images/top_left_corner.png",
                          width: 150),
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
                            style: mainTextStyleBoldBig.copyWith(
                                color: Colors.black),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                    condition: state is ResetPasswordLoading,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: mainColor,
                          ),
                        ),
                      );
                    },
                    fallback: (context) {
                      return ButtonWidget(
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              ResetPasswordCubit.get(context)
                                  .resetPassword(email: emailController.text);
                            }
                          },
                          text: "Reset Password");
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
