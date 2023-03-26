import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/controllers/cubit/signin/signin_cubit.dart';
import 'package:tasks_app/views/widgets/authentication/signin_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const String routeName = "signInScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: SafeArea(
        child: Scaffold(
          body: SignInBody(),
        ),
      ),
    );
  }
}