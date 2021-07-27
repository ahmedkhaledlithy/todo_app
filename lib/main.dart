import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_prof_app/blocs/bloc_observer.dart';
import 'package:todo_prof_app/blocs/date/date_cubit.dart';
import 'package:todo_prof_app/layout/bottom-navigation.dart';
import 'package:todo_prof_app/repository_data/tasks_database.dart';

import 'blocs/bottom_nav/bottom_tab_cubit.dart';
import 'blocs/important_task/task_type_cubit.dart';
import 'blocs/switch/switch_cubit.dart';
import 'blocs/tasks/tasks_cubit.dart';
import 'blocs/time/time_cubit.dart';
import 'blocs/top_buttons/top_buttons_cubit.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runZonedGuarded(
    () => runApp(MultiBlocProvider(
      providers: [
        BlocProvider<TasksCubit>(
          create: (context) => TasksCubit(
              initialState: TaskInitial(), dataBase: TasksDataBase.instance)..createDataBase(),
        ),
        BlocProvider<BottomNavCubit>(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider<TopButtonsCubit>(
          create: (context) => TopButtonsCubit(),
        ),
        BlocProvider<SwitchCubit>(
          create: (context) => SwitchCubit(),
        ),
        BlocProvider<TaskTypeCubit>(
          create: (context) => TaskTypeCubit(),
        ),
        BlocProvider<DateCubit>(
          create: (context) => DateCubit(),
        ),
        BlocProvider<TimeCubit>(
          create: (context) => TimeCubit(),
        ),
      ],
      child:MyApp(),
    )),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
    );
  }
}
