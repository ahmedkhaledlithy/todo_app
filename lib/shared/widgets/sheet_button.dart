import 'package:flutter/material.dart';
import 'package:todo_prof_app/shared/components.dart';
import 'package:todo_prof_app/shared/contants.dart';


class SheetButton extends StatelessWidget {
  final Function? onPress;
  const SheetButton({Key? key,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      child: containerWidget(
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: Color(0xFFFC94A0),
        widget: Align(
            alignment: Alignment.center,
            child: Text(
              "Done",
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        onPress: (){
          onPress!();
        },
      ),
    );
  }
}
