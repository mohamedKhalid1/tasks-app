part of 'manage_tasks_cubit.dart';

@immutable
abstract class ManageTasksState {}

class ManageTasksInitial extends ManageTasksState {}
class ChangeCurrentIndex extends ManageTasksState {}
class InsertToDatabaseState extends ManageTasksState {}
class GetFromDatabaseState extends ManageTasksState {}
class GetFromDatabaseLoadingState extends ManageTasksState {}
class GetFromDatabaseFailureState extends ManageTasksState {
  final String error;

  GetFromDatabaseFailureState(this.error);
}
class CreateDatabaseState extends ManageTasksState {}
