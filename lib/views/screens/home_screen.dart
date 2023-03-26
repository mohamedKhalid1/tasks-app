import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks_app/views/widgets/taskItem.dart';
import '../widgets/floating_action_button_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = "homeScreen";

  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return TaskItem(
                    title: "userName",
                    description:
                        "Don’t worry, we can help you get back on track with your account .",
                    date: "12/12/2023",
                    time: "12:05");
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButtonWidget(),
      ),
    );
  }
}
