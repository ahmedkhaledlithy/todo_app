import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'task_type_state.dart';

class TaskTypeCubit extends Cubit<TaskTypeState> {
  TaskTypeCubit() : super(ChangeTaskType(false));


  void updateType(bool value) {
    emit(ChangeTaskType(value));
  }
}
