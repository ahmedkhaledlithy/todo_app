import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_prof_app/models/task_model.dart';
import 'package:todo_prof_app/shared/contants.dart';


class TasksDataBase{

   // Singleton DatabaseHelper
  static final TasksDataBase instance = TasksDataBase._instance();
  // Singleton Database
  static late Database _db;

  TasksDataBase._instance();


  Future<void> _createDB(Database db, int version) async {
    print("dataBase Created");
    await db.execute(
      'CREATE TABLE $taskTable ($colID INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colContent TEXT,$colDate TEXT,$colTime TEXT,$colStatus TEXT )',
    ).catchError((error){
      print(error.toString());
    });
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "tasks.db";
    final todoList = await openDatabase(path, version: 1, onCreate: _createDB, onOpen:(database){print("dataBase Opened");} );
    return todoList;
  }

  Future<Database> get db async {
      _db = await _initDB();
    return _db;
  }





  Future<List<Map<String, dynamic>>>getTaskMapList()async{
    Database db=await this.db;
    final List<Map<String,dynamic>> result= await db.query(taskTable,orderBy: "id DESC").catchError((error){print(error.toString());});
    return result;
  }

  Future<List<TaskModel>> getTaskList()async{
    final List<Map<String,dynamic>> taskMapList= await getTaskMapList();
    final List<TaskModel> taskList=[];
    taskMapList.forEach((taskMap) {
      taskList.add(TaskModel.fromMap(taskMap));
    });
    taskList.sort((taskA, taskB) => taskA.date==null ? 1: taskB.date==null? -1 : taskA.date!.compareTo(taskB.date!));

     // taskList.sort((taskA,taskB)=>taskA.date!.compareTo(taskB.date!));

    return taskList;
  }

  Future<int> insertTodo(TaskModel task)async{
    Database db=await this.db;
    final int result=await db.insert(taskTable, task.toMap());
    return result;
  }

  Future<int> updateTask(TaskModel task)async{
    Database db=await this.db;
    final int result=await db.update(taskTable, task.toMap(),where: "$colID = ?",whereArgs: [task.id]).catchError((error){
      print(error.toString());
    });
    return result;
  }

  Future<int> deleteTodo(int id)async{
    Database db=await this.db;
    final int result=await db.delete(taskTable,where: "$colID = ?",whereArgs: [id]).catchError((error){
      print(error.toString());
    });
    return result;
  }
  closeDB() async {
    Database db = await this.db;
    await db.close();
  }



}