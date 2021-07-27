import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_prof_app/blocs/date/date_cubit.dart';
import 'package:todo_prof_app/blocs/important_task/task_type_cubit.dart';
import 'package:todo_prof_app/blocs/tasks/tasks_cubit.dart';
import 'package:todo_prof_app/blocs/time/time_cubit.dart';
import 'package:todo_prof_app/models/task_model.dart';
import 'package:todo_prof_app/shared/components.dart';
import 'package:todo_prof_app/shared/contants.dart';
import 'package:todo_prof_app/shared/update_sheet_content.dart';

class ImportantScreen extends StatelessWidget {


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {
        if (state is UpdateTaskState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        TasksCubit cubit = TasksCubit.get(context);

        List<TaskModel> listOfTasks = cubit.importantTasks;
        if (state is TaskLoadingState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        } else {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                  text: "Important",
                  font: 18,
                  weight: FontWeight.bold,
                  color: subTitleButton,
                ),
                listWidget(
                  count: listOfTasks.length > 0 ? listOfTasks.length : 0,
                  context: context,
                  builder: (context, index) {
                    final TaskModel currentTask = listOfTasks[index];


                    return Slidable(
                      actionPane: SlidableScrollActionPane(),
                      actionExtentRatio: 0.25,
                      secondaryActions: [
                        IconSlideAction(
                          iconWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: primaryColor,
                              ),
                              Text(
                                "UPDATE",
                                style: TextStyle(color: primaryColor),
                              ),
                            ],
                          ),
                          color: Colors.transparent,
                          onTap: () {
                            showModalBottomSheet(
                                isDismissible: true,
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                ),
                                builder: (BuildContext bc) {
                                  return UpdateSheetContent(
                                    formKey: formKey,
                                    title: currentTask.title,
                                    details: currentTask.content,
                                    labelStyle: labelStyle,
                                    borderE: borderE,
                                    borderF: borderF,
                                    date: currentTask.date,
                                    time: currentTask.time,
                                    status: currentTask.status,
                                    doneFunction: (title , details) {
                                      if (formKey.currentState!.validate()) {
                                        cubit.updateToDataBase(
                                          taskModel: currentTask,
                                          title: title,
                                          details: details,
                                          date:(context.read<DateCubit>().state as NewDateWasPicked).date,
                                          time: (context.read<TimeCubit>().state as NewTimeWasPicked).time,
                                          status: (context.read<TaskTypeCubit>().state as ChangeTaskType).value== false ? "normal" : "important",
                                        );
                                      }
                                    },
                                  );
                                });

                            // showTask(
                            //   context: context,
                            //   formKey: formKey,
                            //   titleController: titleTaskController,
                            //   detailsController: detailsTaskController,
                            //   labelStyle: labelStyle,
                            //   borderF: borderF,
                            //   borderE: borderE,
                            //   sheetTitle: "Update A Task",
                            //  isImportant: currentTask.status == "important" ? true : false,
                            //  status: currentTask.status!,
                            //  date: date,
                             // time: time,
                              // normalFunction: () {
                              //   cubit.isImportant =
                              //       currentTask.status == "normal"
                              //           ? false
                              //           : true;
                              // },
                              // importantFunction: () {
                              //   cubit.isImportant =
                              //       currentTask.status == "important"
                              //           ? true
                              //           : false;
                              // },
                              // doneFunction: () {
                              //   if (formKey.currentState!.validate()) {
                              //     // cubit.updateToDataBase(
                              //     //   taskModel: currentTask,
                              //     //   titleTaskController:
                              //     //   titleTaskController.text,
                              //     //   detailsTaskController:
                              //     //   detailsTaskController.text,
                              //     //   status: currentTask.status,
                              //     // ).then((value) {
                              //     //   ScaffoldMessenger.of(context).showSnackBar(
                              //     //     SnackBar(
                              //     //       content: Text("task is Updated"),
                              //     //     ),
                              //     //   );
                              //     // });
                              //   }
                              // },


                            // );
                          },
                        ),
                        IconSlideAction(
                          iconWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              Text(
                                "DELETE",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          color: Colors.transparent,
                          onTap: () {
                            cubit
                                .deleteFromDataBase(currentTask.id!)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("task is Deleted"),
                                ),
                              );
                            });
                          },
                        ),
                      ],
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${currentTask.title}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.indigo.shade900,
                                                  decoration: currentTask
                                                              .status ==
                                                          "completed"
                                                      ? TextDecoration
                                                          .lineThrough
                                                      : TextDecoration.none),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            currentTask.status == "important"
                                                ? Container(
                                                    width: 7,
                                                    height: 7,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFC94A0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                  )
                                                : Container(
                                                    width: 7,
                                                    height: 7,
                                                    decoration: BoxDecoration(
                                                        color: primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                  ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.alarm,
                                              color: Color(0XFF757285),
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${currentTask.date} - ${currentTask.time} ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Color(0xFF757285)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75,
                                            child: Text(
                                              currentTask.content,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF757285)),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 1.5,
                                    child: Checkbox(
                                      activeColor: Colors.indigo.shade900,
                                      side: BorderSide(
                                          color: Colors.grey.shade500),
                                      checkColor: Colors.white,
                                      value: currentTask.status == "completed"
                                          ? true
                                          : false,
                                      shape: CircleBorder(),
                                      onChanged: (bool? value) {
                                        currentTask.status = value!
                                            ? "completed"
                                            : currentTask.status;
                                        cubit.updateCompleteToDataBase(
                                            currentTask);
                                        //TasksDataBase.instance.updateTask(currentTask);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
