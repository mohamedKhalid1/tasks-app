import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/controllers/cubit/signup/sign_up_cubit.dart';
import 'package:tasks_app/views/screens/authentication/signin_screen.dart';
import '../../../utils/constants.dart';
import '../../screens/home_screen.dart';
import '../button_widget.dart';
import '../textfiled_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController userIDController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          getSnackBar(context, state.error, Colors.red);
        }
        if (state is SignUpSuccess) {
          Navigator.of(context).pushNamed(HomeScreen.routeName);
          getSnackBar(context, "Sign Up Successfully", Colors.green);
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
                            style: mainTextStyleBoldBig.copyWith(
                                color: Colors.black),
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
                        ],
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                    condition: state is SignUpLoading,
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
                              SignUpCubit.get(context).signUp(
                                  emailAddress: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text);
                            }
                          },
                          text: "Sign Up");
                    },
                  ),
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
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
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
          ),
        );
      },
    );
  }
}
