import 'package:flutter/material.dart';
import 'package:todo_prof_app/shared/contants.dart';

class CustomTextForm extends StatelessWidget {
  late final TextEditingController? controller;
 final String label;
 final String validMessage;
  final ValueChanged<String>? onChanged;
   CustomTextForm({ this.controller,required this.label,required this.validMessage, this.onChanged,}) ;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      cursorColor: primaryColor,
      keyboardType: TextInputType.multiline,
      controller: controller,
      style: TextStyle(
        color: primaryColor,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        prefixIcon: Icon(
          Icons.rate_review,
          color: subTitleButton,
        ),
        fillColor: greyBgButton,
        focusedBorder: borderF,
        enabledBorder: borderE,
        border: borderE,
        filled: true,
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validMessage;
        } else {
          return null;
        }
      },
    );
  }
}
