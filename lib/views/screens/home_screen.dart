import 'package:flutter/material.dart';
import 'package:tasks_app/controllers/cubit/manage_tasks/manage_tasks_cubit.dart';
import 'package:tasks_app/utils/constants.dart';
import '../widgets/floating_action_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = "homeScreen";

  @override
  Widget build(BuildContext context) {
    var tasksCubit = ManageTasksCubit.get(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Text(
          titles[tasksCubit.currentIndex],
            style: mainTextStyleBoldBig.copyWith(fontSize: 25,color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: screens[tasksCubit.currentIndex],
        floatingActionButton: FloatingActionButtonWidget(),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: mainColor,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onTap: (value) {
              tasksCubit.changeCurrentIndex(value);
            },
            currentIndex: tasksCubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book), label: "New Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_box), label: "Done Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive), label: "Archived Tasks"),
            ]),
      ),
    );
  }
}
