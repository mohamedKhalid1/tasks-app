import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasks_app/utils/constants.dart';

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
      version: 11,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, description TEXT, date TEXT, time TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

  // createDatabase() {
  //   openDatabase(databasePath,
  //       version: version, onCreate: (Database database, int version)async{
  //     await onCreate(database);
  //       }).then((value) => print("ttt $database created"));
  //
  // }

  // onCreate(
  //   Database database,
  // ) async{
  //   print("on create....");
  //    await database.execute(
  //           'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, description TEXT, date TEXT, time TEXT)')
  //       .then((value) => print("table created")).catchError((error){
  //         print("errrrorrr $error");
  //    });
  // }

  insertToDatabase(
      {required String title,
      required String description,
      required String date,
      required String time}) async {
    await database?.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks (title,description,date,time) VALUES ("$title", "$description", "$date", "$time")');
    }).then((value) {
      getFromDatabase(database);
      emit(InsertToDatabaseState());
    }).catchError((error) {
    });
  }

  getFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(GetFromDatabaseLoadingState());
    database?.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        newTasks.add(element);
      });
      print(newTasks);
      emit(GetFromDatabaseState());
    }).catchError((error){
      GetFromDatabaseFailureState(error.toString());
    });
  }
}
