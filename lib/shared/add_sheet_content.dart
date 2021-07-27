import 'package:flutter/material.dart';
import 'package:todo_prof_app/shared/custom_text_form.dart';
import 'package:todo_prof_app/shared/widgets/date_widget.dart';
import 'package:todo_prof_app/shared/widgets/sheet_button.dart';
import 'package:todo_prof_app/shared/widgets/sheet_title.dart';
import 'package:todo_prof_app/shared/widgets/switch_widget.dart';
import 'package:todo_prof_app/shared/widgets/task_type.dart';
import 'package:todo_prof_app/shared/widgets/time_widget.dart';
import 'package:todo_prof_app/shared/widgets/title_input.dart';

import 'contants.dart';

class AddSheetContent extends StatelessWidget {
  late final formKey;
  late final TextEditingController titleController;
  late final TextEditingController detailsController;
  final TextStyle? labelStyle;
  final OutlineInputBorder? borderF;
  final OutlineInputBorder? borderE;
  final String? labelTitle;
  final String? labelDescription;
  final String? sheetTitle;
  late final Function doneFunction;

  AddSheetContent({
    required this.formKey,
    required this.titleController,
    required this.detailsController,
    this.labelStyle,
    this.borderF,
    this.borderE,
    this.labelTitle = "Task Title",
    this.labelDescription = "Task details",
    this.sheetTitle = "Create A Task",
    required this.doneFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 5,),
                SheetTitle(sheetTitle: sheetTitle!,),
                SizedBox(height: 5,),
                Divider(color: grey700Color,),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputTitle(text: 'Task title', weight: FontWeight.w600, font: 16, color: Color(0xFF757285),),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextForm(
                          controller: titleController,
                          label: labelTitle!,
                          validMessage: "Enter Your Task Title"),
                      SizedBox(
                        height: 18,
                      ),
                      InputTitle(text: 'Task details', weight: FontWeight.w600, font: 16, color: Color(0xFF757285),),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextForm(
                          controller: detailsController,
                          label: labelDescription!,
                          validMessage: "Enter Your Task Content"),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                          child: InputTitle(text: 'Task Type', weight: FontWeight.w600, font: 16, color: Color(0xFF757285),),
                      ),
                      TaskType(),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child:InputTitle(text: 'Choose date & time', weight: FontWeight.w600, font: 15, color: Color(0xFF757285),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DateWidget(date: 'Select a date',),
                          SizedBox(
                            width: 10,
                          ),
                          TimeWidget(time: "Select Time",),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InputTitle(text: "Get alert for this task", font: 18, color: primaryColor, weight: FontWeight.w800),
                            SwitchWidget(),
                          ],
                        ),
                      ),
                      SheetButton(onPress: () {
                        doneFunction();
                      },),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
