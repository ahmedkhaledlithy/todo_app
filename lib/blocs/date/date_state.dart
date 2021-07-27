part of 'date_cubit.dart';

abstract class DateState extends Equatable {
  const DateState();
}

class InitialDate extends DateState {
  @override
  List<Object> get props => [];
}

class GetDate extends DateState {

  GetDate();

  @override
  List<Object?> get props => [];
}

class NewDateWasPicked extends DateState {
  final String date;
  NewDateWasPicked({required this.date});
  @override
  List<Object?> get props => [date];
}
