import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_prof_app/blocs/time/time_cubit.dart';
import 'package:todo_prof_app/shared/components.dart';

import 'package:todo_prof_app/shared/contants.dart';

class TimeWidget extends StatelessWidget {
  final String time;
  const TimeWidget({Key? key,required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TimeCubit, TimeState>(
      listener: (context, state)async{
        if (state is GetTime) {
          final _result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

          if (_result == null) return;
          context.read<TimeCubit>().takeTime(_result.format(context).toString());
        }
      },
      builder: (context, state) {
        String? _currentTime;
        if (state is NewTimeWasPicked) {
          _currentTime = state.time;
        }
        return containerWidget(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 50,
          color: greyBgButton,
          widget: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${_currentTime !=null ? _currentTime :time }",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          onPress: () {
            context.read<TimeCubit>().getTime();
          },
        );
      },
    );
  }
}
