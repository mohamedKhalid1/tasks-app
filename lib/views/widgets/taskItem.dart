import 'package:flutter/material.dart';
import 'package:tasks_app/utils/constants.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(
      {Key? key,
      required this.title,
      required this.status,
      required this.updateToDone,
      required this.updateToArchived,
      required this.deleteData,
      required this.description,
      required this.date,
      required this.time,
      required this.id})
      : super(key: key);
  static const String routeName = "homeScreen";
  final String title, description, date, time, status;
  final int id;
  final Function updateToDone;
  final Function updateToArchived;
  final Function deleteData;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        deleteData();
      },
      key: Key(id.toString()),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Card(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent)),
          elevation: 20,
          color: status == "done"
              ? Colors.lightGreenAccent
              : status == "archived"
                  ? Colors.orangeAccent
                  : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style:
                            mainTextStyleBoldBig.copyWith(color: Colors.black),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        updateToDone();
                      },
                      icon: Icon(
                        status == "done"
                            ? Icons.check_box
                            : Icons.check_box_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          updateToArchived();
                        },
                        icon: Icon(
                          status == "archived"
                              ? Icons.archive
                              : Icons.archive_outlined,
                          color: Colors.black,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: mainTextStyleBoldBig.copyWith(
                          fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      time,
                      style: mainTextStyleBoldBig.copyWith(color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
