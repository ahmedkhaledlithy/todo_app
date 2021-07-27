import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_prof_app/blocs/switch/switch_cubit.dart';
import 'package:todo_prof_app/shared/contants.dart';


class SwitchWidget extends StatelessWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchCubit, bool>(
      builder: (context, state) {
        return Switch(
          value: state,
          onChanged: (bool value) {
            context
                .read<SwitchCubit>()
                .updateToggle(value);
          },
          activeColor: primaryColor,
        );
      },
    );
  }
}
