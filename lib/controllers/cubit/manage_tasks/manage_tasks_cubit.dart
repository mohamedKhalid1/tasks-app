import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'manage_tasks_state.dart';

class ManageTasksCubit extends Cubit<ManageTasksState> {
  ManageTasksCubit() : super(ManageTasksInitial());
  static ManageTasksCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  changeCurrentIndex(int value){
    currentIndex=value;
    emit(ChangeCurrentIndex());
  }
}
