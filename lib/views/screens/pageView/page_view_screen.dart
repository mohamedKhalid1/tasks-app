import 'package:flutter/material.dart';
import 'package:tasks_app/utils/constants.dart';
import 'package:tasks_app/views/screens/authentication/login_screen.dart';
import 'package:tasks_app/views/screens/home_screen.dart';
import 'package:tasks_app/views/widgets/button_widget.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/top_left_corner.png", width: 200),
          Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                  height: 200,
                ),
                Text(
                  "Get things done with Tasks App",
                  style: mainTextStyleBold,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 230,
                  child: Text(
                    "You are now about to take the first step in the ladder of organizing and managing your time as required. Good luck to you, my friend",
                    style: mainTextStyle,
                  ),
                ),
              ],
            ),
          ),
          ButtonWidget(
            onPress: () {
             return Navigator.pushReplacement(context,  MaterialPageRoute<void>(
               builder: (BuildContext context) =>  LoginScreen(),
             ),);
            },
            text: 'Get Started',
          ),
        ],
      ),
    );
  }
}
