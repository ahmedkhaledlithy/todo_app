part of 'time_cubit.dart';

abstract class TimeState extends Equatable {
  const TimeState();
}

class InitialTime extends TimeState {

  @override
  List<Object> get props => [];
}

class GetTime extends TimeState {

  GetTime();

  @override
  List<Object?> get props => [];
}

class NewTimeWasPicked extends TimeState {
  final String time;
  NewTimeWasPicked({required this.time});
  @override
  List<Object?> get props => [time];
}
