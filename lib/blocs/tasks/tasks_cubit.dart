import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_prof_app/models/task_model.dart';
import 'package:todo_prof_app/repository_data/tasks_database.dart';


part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksDataBase dataBase;

  TasksCubit({required TasksState initialState, required this.dataBase})
      : super(initialState);

  static TasksCubit get(context) => BlocProvider.of(context);



  List<TaskModel> normalTasks = [];
  List<TaskModel> completeTasks = [];
  List<TaskModel> importantTasks = [];


 void createDataBase()  {
    dataBase.db.then((value) {
      getFromDataBase();
    });
    emit(InitDataBaseState());
  }

  getFromDataBase()  {
    normalTasks = [];
    completeTasks = [];
    importantTasks = [];

    emit(TaskLoadingState());
    dataBase.getTaskList().then((value) {
      value.forEach((element) {
        if (element.status == "normal")
          normalTasks.add(element);
        else if (element.status == "important")
          importantTasks.add(element);
        else
          completeTasks.add(element);
      });
      emit(GetTaskDataState());
    });
  }

  void insertToDataBase({titleTaskController, detailsTaskController,date,time,status}) {
    dataBase.insertTodo(TaskModel(
      title: titleTaskController,
      content: detailsTaskController,
       date: date,
      time: time,
      status: status
    )).then((value) {
      print(value);
      emit(AddTaskState());
      getFromDataBase();
    });
  }

  void updateToDataBase({required TaskModel taskModel, title, details, status,date,time})  {
    print(taskModel.title);
    try {
      TaskModel model = taskModel.copyWith(
        title: title,
        content: details,
        date: date,
        time: time,
        status: status,
      );

      dataBase.updateTask(model).then((value) {
        print(value);
      });
      emit(UpdateTaskState());
      getFromDataBase();
    } catch (e) {
      print(e);
    }
  }

  Future deleteFromDataBase(int id) async {
    await dataBase.deleteTodo(id).then((value) {
      emit(DeleteTaskState());
      getFromDataBase();
    });
  }

  void updateCompleteToDataBase(TaskModel model) async{
   await dataBase.updateTask(model);
   getFromDataBase();
   emit(UpdateCompleteState());
  }
}
