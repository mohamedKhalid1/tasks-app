import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/controllers/cubit/signup/sign_up_cubit.dart';
import 'package:tasks_app/views/widgets/authentication/signup_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = "signupScreen";


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: SafeArea(
        child: Scaffold(
          body: SignUpBody(),
        ),
      ),
    );
  }
}
