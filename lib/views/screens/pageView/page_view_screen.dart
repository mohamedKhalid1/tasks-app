import 'package:flutter/material.dart';
import 'package:tasks_app/utils/constants.dart';
import 'package:tasks_app/views/screens/authentication/signin_screen.dart';
import 'package:tasks_app/views/widgets/button_widget.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({Key? key}) : super(key: key);
  static const String routeName = "pageViewScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/top_left_corner.png", width: 150),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 200,
                        height: 200,
                      ),
                      Text(
                        "Get things done with Tasks App",
                        style:
                            mainTextStyleBoldBig.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "You are now about to take the first step in the ladder of organizing and managing your time as required. Good luck to you, my friend",
                          style: mainTextStyle.copyWith(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.12,),
                ButtonWidget(
                  onPress: () {
                    return Navigator.pushReplacementNamed(
                        context, SignInScreen.routeName);
                  },
                  text: 'Get Started',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
