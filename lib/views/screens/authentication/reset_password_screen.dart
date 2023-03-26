import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/controllers/cubit/reset_password/reset_password_cubit.dart';

import '../../widgets/authentication/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);
  static const String routeName = "resetPasswordScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: SafeArea(
        child: Scaffold(
          body: ResetPasswordBody(),
        ),
      ),
    );
  }
}
