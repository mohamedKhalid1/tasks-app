import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/controllers/cubit/manage_tasks/manage_tasks_cubit.dart';
import 'package:tasks_app/utils/constants.dart';

import '../widgets/taskItem.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageTasksCubit, ManageTasksState>(
      listener: (context, state) {
        // ManageTasksCubit.get(context).getFromDatabase();
        if (state is GetFromDatabaseFailureState) {
          getSnackBar(context, state.error, Colors.red);
        }
        else if (state is GetFromDatabaseState) {
          getSnackBar(context, "Get Tasks Successfully", Colors.green);
        }
      },
      builder: (context, state) {
        var tasks = ManageTasksCubit.get(context).newTasks;
        return ConditionalBuilder(
          condition: state is! GetFromDatabaseLoadingState,
          builder: (BuildContext context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskItem(
                        title: tasks[index]['title'],
                        description: tasks[index]['description'],
                        date: tasks[index]['date'],
                        time: tasks[index]['time']);
                  },
                ),
              ),
            );
          },
          fallback: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
