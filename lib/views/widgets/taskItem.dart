import 'package:flutter/material.dart';
import 'package:tasks_app/utils/constants.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(
      {Key? key,
      required this.title,
      required this.description,
      required this.date,
      required this.time})
      : super(key: key);
  static const String routeName = "homeScreen";
  final String title, description, date, time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent)),
        elevation: 50,
        shadowColor: mainColor,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: mainTextStyleBold,
                  ),
                  Text(
                    "  High  ",
                    style:
                        mainTextStyleBold.copyWith(backgroundColor: Colors.red,),
                  )
                ],
              ),
              Text(
                description,
                style: mainTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(date), Text(time)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
