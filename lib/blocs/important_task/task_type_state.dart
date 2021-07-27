part of 'task_type_cubit.dart';

@immutable
abstract class TaskTypeState extends Equatable{}



class ChangeTaskType extends TaskTypeState {
  final bool value;
  ChangeTaskType(this.value);
  @override
  List<Object?> get props => [value];
}
