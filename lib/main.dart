import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/controllers/cubit/manage_tasks/manage_tasks_cubit.dart';
import 'package:tasks_app/utils/constants.dart';
import 'package:tasks_app/views/screens/authentication/signin_screen.dart';
import 'package:tasks_app/views/screens/authentication/reset_password_screen.dart';
import 'package:tasks_app/views/screens/authentication/signup_screen.dart';
import 'package:tasks_app/views/screens/home_screen.dart';
import 'package:tasks_app/views/screens/pageView/page_view_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageTasksCubit()..createDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tasks App',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent, // <-- SEE HERE
              statusBarIconBrightness: Brightness
                  .dark, //<-- For Android SEE HERE (dark icons)
            ),
          ),
          scaffoldBackgroundColor: backgroundColor,
          primarySwatch: Colors.blue,
        ),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          SignInScreen.routeName: (context) => const SignInScreen(),
          ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
        },
        home: const PageViewScreen(),
      ),
    );
  }
}
