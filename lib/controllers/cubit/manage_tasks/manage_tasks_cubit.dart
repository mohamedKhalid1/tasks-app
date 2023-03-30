import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'manage_tasks_state.dart';

class ManageTasksCubit extends Cubit<ManageTasksState> {
  ManageTasksCubit() : super(ManageTasksInitial());

  static ManageTasksCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int version = 1;
  String databasePath = 'tasks.db';

  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  changeCurrentIndex(int value) {
    currentIndex = value;
    emit(ChangeCurrentIndex());
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, description TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {})
            .catchError((error) {});
      },
      onOpen: (database) {
        getFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

  insertToDatabase(
      {required String title,
      required String description,
      required String date,
      required String time}) async {
    await database?.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks (title,description,date,time,status) VALUES ("$title", "$description", "$date", "$time", "new")');
    }).then((value) {
      getFromDatabase(database);
      emit(InsertToDatabaseState());
    }).catchError((error) {});
  }

  getFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(GetFromDatabaseLoadingState());
    database?.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element["status"] == "new") {
          newTasks.add(element);
        } else if (element["status"] == "done") {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      });
      emit(GetFromDatabaseState());
    }).catchError((error) {
      GetFromDatabaseFailureState(error.toString());
    });
  }

  void updateData({
    required String status,
    required int id,
  }) async {
    database?.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then((value) {
      getFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({
    required int id,
  }) async {
    database?.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getFromDatabase(database);
      emit(DeleteFromDatabaseState());
    });
  }
}
