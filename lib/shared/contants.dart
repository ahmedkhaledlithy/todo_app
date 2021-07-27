import 'package:flutter/material.dart';

const Color nameColor = Color(0XFF7F7C8A);
final Color primaryColor = Colors.indigo.shade900;
final Color greyBgButton = Colors.grey.shade200;
const Color subTitleButton = Color(0XFFBDBEC5);
const Color whiteColor = Colors.white;
final Color? grey400Color = Colors.grey[400];
final Color? grey700Color = Colors.grey[700];



OutlineInputBorder borderE = OutlineInputBorder(

  borderSide: BorderSide(
    color: grey400Color!,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(20),
);
OutlineInputBorder borderF = OutlineInputBorder(
  borderSide: BorderSide(
    width: 1,
    color: grey400Color!,

  ),
  borderRadius: BorderRadius.circular(20),
);
TextStyle labelStyle = TextStyle(color: subTitleButton, inherit: true);



String taskTable = "taskTable";
String colID = "id";
String colTitle = "title";
String colContent = "content";
String colDate = "date";
String colTime = "time";
String colStatus = "status";





