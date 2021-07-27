import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_prof_app/blocs/date/date_cubit.dart';
import 'package:todo_prof_app/blocs/important_task/task_type_cubit.dart';
import 'package:todo_prof_app/blocs/tasks/tasks_cubit.dart';
import 'package:todo_prof_app/blocs/time/time_cubit.dart';
import 'package:todo_prof_app/blocs/top_buttons/top_buttons_cubit.dart';
import 'package:todo_prof_app/modules/all_tasks/tasks_screen.dart';
import 'package:todo_prof_app/modules/complete_tasks/complete_screen.dart';
import 'package:todo_prof_app/modules/imporatant_tasks/important_screen.dart';
import 'package:todo_prof_app/shared/add_sheet_content.dart';
import 'package:todo_prof_app/shared/components.dart';
import 'package:todo_prof_app/shared/contants.dart';


class HomeScreen extends StatelessWidget {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController detailsTaskController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Widget screenRoute(int index) {
    if (index == 0) {
      return TasksScreen();
    } else if (index == 1) {
      return CompleteScreen();
    } else if (index == 2) {
      return ImportantScreen();
    } else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopButtonsCubit, int>(
      builder: (context, btState) {
        return BlocConsumer<TasksCubit, TasksState>(
          listener: (context, state) {
            if (state is AddTaskState) {
              titleTaskController.clear();
              detailsTaskController.clear();
              Navigator.pop(context);

            }
          },
          builder: (context, state) {
            TasksCubit cubit = TasksCubit.get(context);
            return Padding(
              padding: const EdgeInsets.only(
                  top: 40, right: 20, left: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: containerWidget(
                            widget: Image(
                              width: 45,
                              height: 45,
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dXNlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                            ),
                            onPress: () {}),
                      ),

                           containerWidget(
                            onPress: () {

                              showModalBottomSheet(
                                  isDismissible: true,
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                  ),
                                  builder: (BuildContext bc) {
                                    return AddSheetContent(
                                      formKey: formKey,
                                      titleController: titleTaskController,
                                      detailsController: detailsTaskController,
                                      labelStyle: labelStyle,
                                      borderE: borderE,
                                      borderF: borderF,
                                      doneFunction: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.insertToDataBase(
                                            titleTaskController: titleTaskController.text,
                                            detailsTaskController: detailsTaskController.text,
                                            date: (context.read<DateCubit>().state as NewDateWasPicked).date,
                                            time: (context.read<TimeCubit>().state as NewTimeWasPicked).time,
                                            status: (context.read<TaskTypeCubit>().state as ChangeTaskType).value== false ? "normal" : "important",
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("task is Added"),),);
                                        }
                                      },
                                    );
                                  });
                            },
                          ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textWidget(
                    text: "Hello , ",
                    font: 25,
                    weight: FontWeight.bold,
                    color: nameColor,
                  ),
                  textWidget(
                    text: "Ahmed Khaled ",
                    font: 29,
                    weight: FontWeight.bold,
                    color: Colors.indigo.shade900,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        containerWidget(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.1,
                            color: btState == 0
                                ? Colors.indigo.shade500
                                : greyBgButton,
                            widget: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Normal",
                                style: TextStyle(
                                    color: btState == 0
                                        ? whiteColor
                                        : primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPress: () {
                              context.read<TopButtonsCubit>().updateIndex(0);
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        containerWidget(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.1,
                            color: btState == 1
                                ? Colors.indigo.shade500
                                : greyBgButton,
                            widget: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Completed",
                                  style: TextStyle(
                                      color: btState == 1
                                          ? whiteColor
                                          : primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                            onPress: () {
                              context.read<TopButtonsCubit>().updateIndex(1);
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        containerWidget(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.1,
                            color: btState == 2
                                ? Colors.indigo.shade500
                                : greyBgButton,
                            widget: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Important",
                                  style: TextStyle(
                                      color: btState == 2
                                          ? whiteColor
                                          : primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                            onPress: () {
                              context.read<TopButtonsCubit>().updateIndex(2);
                            }),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  screenRoute(btState),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
