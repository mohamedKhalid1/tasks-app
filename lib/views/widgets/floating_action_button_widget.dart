import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/controllers/cubit/manage_tasks/manage_tasks_cubit.dart';
import 'package:tasks_app/views/widgets/textfiled_widget.dart';
import '../../utils/constants.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  FloatingActionButtonWidget({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController degreeOfImportantController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageTasksCubit, ManageTasksState>(
      listener: (context, state) {
        if (state is InsertToDatabaseState) {
          getSnackBar(context, "Inserted Successfully", Colors.green);
          Navigator.of(context).pop();
          timeController.text = "";
          descriptionController.text = "";
          dateController.text = "";
          titleController.text = "";
        }
      },
      builder: (context, state) {
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
                      elevation: 0,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 25, right: 25),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Task Title",
                                      style: mainTextStyleBold,
                                    ),
                                    TextFieldInput(
                                      textEditingController: titleController,
                                      hintText: "Enter your task title",
                                      textInputType: TextInputType.name,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Task description",
                                      style: mainTextStyleBold,
                                    ),
                                    TextFieldInput(
                                      textEditingController:
                                          descriptionController,
                                      hintText: "Enter your Task description",
                                      textInputType: TextInputType.name,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Task Date",
                                      style: mainTextStyleBold,
                                    ),
                                    TextFieldInput(
                                      onTapped: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime.now().add(
                                                    const Duration(days: 365)))
                                            .then((value) =>
                                                dateController.text =
                                                    DateFormat.yMMMd()
                                                        .format(value!)
                                                        .toString());
                                      },
                                      textEditingController: dateController,
                                      hintText: "Enter your Task date",
                                      textInputType: TextInputType.name,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Task Time",
                                      style: mainTextStyleBold,
                                    ),
                                    TextFieldInput(
                                      onTapped: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) =>
                                                timeController.text = value!
                                                    .format(context)
                                                    .toString());
                                      },
                                      textEditingController: timeController,
                                      hintText: "Enter your Task time",
                                      textInputType: TextInputType.name,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.55,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                ManageTasksCubit.get(context)
                                                    .insertToDatabase(
                                                        title: titleController
                                                            .text,
                                                        description:
                                                            descriptionController
                                                                .text,
                                                        date:
                                                            dateController.text,
                                                        time: timeController
                                                            .text);
                                              }
                                            },
                                            child: Text(
                                              "Add Task",
                                              style: mainTextStyleBoldBig,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          margin: const EdgeInsets.all(20),
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              timeController.text = "";
                                              descriptionController.text = "";
                                              dateController.text = "";
                                              titleController.text = "";
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
      },
    );
  }
}
