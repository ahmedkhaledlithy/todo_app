import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_prof_app/blocs/important_task/task_type_cubit.dart';
import 'package:todo_prof_app/shared/components.dart';
import 'package:todo_prof_app/shared/contants.dart';

class TaskType extends StatelessWidget {
  const TaskType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TaskTypeCubit, TaskTypeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            containerWidget(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 50,
              color:(state is ChangeTaskType)? state.value==true ? Colors.indigo.shade500:greyBgButton:greyBgButton,
              widget: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Important",
                    style: TextStyle(
                        color:(state is ChangeTaskType)? state.value==true
                            ? whiteColor
                            : primaryColor:primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )),
              onPress: () {
                context.read<TaskTypeCubit>().updateType(true);
              },
            ),
            containerWidget(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 50,
              color: (state is ChangeTaskType)? state.value==false
                  ? Colors.indigo.shade500
                  : greyBgButton:Colors.indigo.shade500,
              widget: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Normal",
                    style: TextStyle(
                        color:(state is ChangeTaskType)?  state.value==false
                            ? whiteColor
                            : primaryColor:whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )),
              onPress: () {
                context.read<TaskTypeCubit>().updateType(false);
              },
            ),
          ],
        );
      },
    );
  }
}
