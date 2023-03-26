import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/controllers/cubit/signin/signin_cubit.dart';
import 'package:tasks_app/views/screens/authentication/reset_password_screen.dart';
import 'package:tasks_app/views/screens/authentication/signup_screen.dart';
import '../../../utils/constants.dart';
import '../../screens/home_screen.dart';
import '../button_widget.dart';
import '../textfiled_widget.dart';

class SignInBody extends StatelessWidget {
  SignInBody({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          getSnackBar(context, state.error, Colors.red);
        } if(state is SignInSuccess) {
          Navigator.of(context)
              .pushNamed(HomeScreen.routeName);
          getSnackBar(context, "SignIn Successfully",
              Colors.green);
        }      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.2,
            child: Form(
              key: formKey,
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
                            "Sign in",
                            style: mainTextStyleBoldBig.copyWith(
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
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
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              TextButton(
                                child: Text(
                                  "Forgot Password?",
                                  textAlign: TextAlign.right,
                                  style: mainTextStyle,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ResetPasswordScreen.routeName);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                    condition: state is SignInLoading,
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
                      return ButtonWidget (
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                               SignInCubit.get(context).signIn(
                                  emailAddress: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          text: "Sign in");
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.17),
                    child: Row(
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: mainTextStyle,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                          child: Text(
                            "Sign Up",
                            style: mainTextStyle,
                          ),
                        ),
                      ],
                    ),
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
