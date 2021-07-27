import 'package:bloc/bloc.dart';

class TopButtonsCubit extends Cubit<int> {

  TopButtonsCubit() : super(0);

  void updateIndex(int index) => emit(index);


  void getNormalTasks() => emit(0);
  void getCompleteTasks() => emit(1);
  void getImportantTasks() => emit(2);

}
