import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/controllers/cubit/manage_tasks/manage_tasks_cubit.dart';
import 'package:tasks_app/utils/constants.dart';
import '../widgets/floating_action_button_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = "homeScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageTasksCubit(),
      child: BlocConsumer<ManageTasksCubit, ManageTasksState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: screens[ManageTasksCubit.get(context).currentIndex],
              floatingActionButton: FloatingActionButtonWidget(),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: mainColor,
                  backgroundColor: backgroundColor,
                  onTap: (value) {
                    ManageTasksCubit.get(context).changeCurrentIndex(value);
                  },
                  currentIndex: ManageTasksCubit.get(context).currentIndex,
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
        },
      ),
    );
  }
}

// SizedBox(
// height: MediaQuery.of(context).size.height,
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 15),
// child: ListView.builder(
// itemCount: 10,
// itemBuilder: (context, index) {
// return TaskItem(
// title: "userName",
// description:
// "Don’t worry, we can help you get back on track with your account .",
// date: "12/12/2023",
// time: "12:05");
// },
// ),
// ),
// ),
