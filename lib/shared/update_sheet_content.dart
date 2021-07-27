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



class UpdateSheetContent extends StatefulWidget {

  late final GlobalKey<FormState> formKey;
  final TextStyle? labelStyle;
  final OutlineInputBorder? borderF;
  final OutlineInputBorder? borderE;
  final String? labelTitle;
  final String? labelDescription;
  final String? sheetTitle;
  final String? title;
  final String? details;
  final String? date;
  final String? time;
  final String? status;
  late final void Function(String title, String details) doneFunction;


  UpdateSheetContent({
    required this.formKey,
    this.title,
    this.details,
    this.date,
    this.time,
    this.status,
    this.labelStyle,
    this.borderF,
    this.borderE,
    this.labelTitle = "Task Title",
    this.labelDescription = "Task details",
    this.sheetTitle = "Update A Task",
    required this.doneFunction,
  });

  @override
  _UpdateSheetContentState createState() => _UpdateSheetContentState();
}

class _UpdateSheetContentState extends State<UpdateSheetContent> {

  late  final TextEditingController _titleController;
  late final TextEditingController _detailsController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.title);
    _detailsController = TextEditingController(text: widget.details);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

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
            key: widget.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                SheetTitle(sheetTitle: widget.sheetTitle!,),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: grey700Color,
                ),
                SizedBox(
                  height: 10,
                ),
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
                          controller: _titleController,
                          label: widget.labelTitle!,
                          validMessage: "Enter Your Task Title"),
                      SizedBox(
                        height: 18,
                      ),
                      InputTitle(text: 'Task details', weight: FontWeight.w600, font: 16, color: Color(0xFF757285),),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextForm(
                          controller: _detailsController,
                          label: widget.labelDescription!,
                          validMessage: "Enter Your Task Content"),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InputTitle(text: 'Task Type', weight: FontWeight.w600, font: 16, color: Color(0xFF757285),),
                      ),
                      TaskType(),                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child:InputTitle(text: 'Choose date & time', weight: FontWeight.w600, font: 15, color: Color(0xFF757285),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DateWidget(date: widget.date!,),
                          SizedBox(
                            width: 10,
                          ),
                          TimeWidget(time: widget.time!,),
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
                        final _title = _titleController.text;
                        final _details = _detailsController.text;
                        widget.doneFunction(_title, _details);
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
