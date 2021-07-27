part of 'tasks_cubit.dart';

abstract class TasksState extends Equatable {
  const TasksState();
  @override
  List<Object?> get props => [];
}


class InitDataBaseState extends TasksState {}
class TaskInitial extends TasksState {}
class TaskLoadingState extends TasksState {}
class UpdateCompleteState extends TasksState {}

class GetTaskDataState extends TasksState {
  @override
  List<Object?> get props => [];
}
class AddTaskState extends TasksState {

  @override
  List<Object?> get props => [];
}
class UpdateTaskState extends TasksState {
  @override
  List<Object?> get props => [];
}
class DeleteTaskState extends TasksState {
  @override
  List<Object?> get props => [];
}
