import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_prof_app/blocs/date/date_cubit.dart';
import 'package:todo_prof_app/shared/components.dart';
import 'package:todo_prof_app/shared/contants.dart';


class DateWidget extends StatelessWidget {
 final String date;
  const DateWidget({Key? key,required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DateCubit, DateState>(
      listener: (context, state)async{
        if (state is GetDate) {
          final _result = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030),
          );

          if (_result == null) return;
          context.read<DateCubit>().takeDate(DateFormat.yMMMd().format(_result));
        }
      },
      builder: (context, state) {
        String? _date;
        if (state is NewDateWasPicked) {
          _date = state.date;
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
                    Icons.calendar_today,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${ _date != null ? _date : date }",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          onPress: () {
            context.read<DateCubit>().getDate();
          },
        );
      },
    );
  }
}
