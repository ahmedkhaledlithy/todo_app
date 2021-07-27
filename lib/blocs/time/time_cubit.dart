import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  TimeCubit() : super(InitialTime());


  void getTime() {
    emit(GetTime());
  }

  void takeTime(String time) {
    emit(NewTimeWasPicked(time: time));
  }

}
