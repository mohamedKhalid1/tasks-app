import 'package:flutter/material.dart';
import 'package:tasks_app/views/widgets/textfiled_widget.dart';

import '../../utils/constants.dart';
import 'button_widget.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  FloatingActionButtonWidget({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController degreeOfImportantController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(50)),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, elevation: 0),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              showModalBottomSheet(
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Task Title",
                              style: mainTextStyleBold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldInput(
                              textEditingController: titleController,
                              hintText: "Enter your task title",
                              textInputType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Task description",
                              style: mainTextStyleBold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldInput(
                              textEditingController: descriptionController,
                              hintText: "Enter your Task description",
                              textInputType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Task Date",
                              style: mainTextStyleBold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldInput(
                              onTapped: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now()
                                            .add(Duration(days: 365)))
                                    .then((value) =>
                                        dateController.text = value.toString());
                              },
                              textEditingController: dateController,
                              hintText: "Enter your Task date",
                              textInputType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Task Time",
                              style: mainTextStyleBold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldInput(
                              onTapped: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) => timeController.text =
                                        value!.format(context).toString());
                              },
                              textEditingController: timeController,
                              hintText: "Enter your Task time",
                              textInputType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Add Task",
                                      style: mainTextStyleBoldBig,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  margin: const EdgeInsets.all(20),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: mainTextStyleBoldBig,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent);
            }),
      ),
    );
  }
}
