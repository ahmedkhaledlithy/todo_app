import 'package:flutter/material.dart';
import 'package:todo_prof_app/shared/contants.dart';

class SheetTitle extends StatelessWidget {
 final String sheetTitle;
  const SheetTitle({Key? key,required this.sheetTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
          offset: Offset(10, 0),
          child: Text(
            "$sheetTitle",
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        Transform.translate(
          offset: Offset(100, 0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
