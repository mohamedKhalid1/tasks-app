import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasks_app/utils/constants.dart';
import 'package:tasks_app/views/screens/authentication/signin_screen.dart';
import 'package:tasks_app/views/screens/authentication/reset_password_screen.dart';
import 'package:tasks_app/views/screens/authentication/signup_screen.dart';
import 'package:tasks_app/views/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        HomeScreen.routeName: (context) => HomeScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        SignInScreen.routeName: (context) => SignInScreen(),
        ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
      },
      home: SignUpScreen(),
    );
  }
}
