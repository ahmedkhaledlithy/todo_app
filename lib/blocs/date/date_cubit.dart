import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit(): super(InitialDate());


  void getDate() {
    emit(GetDate());
  }

  void takeDate(String dateTime) {
    emit(NewDateWasPicked(date: dateTime));
  }

}
