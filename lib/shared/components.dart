import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget containerWidget(
    {double width = 45,
    double height = 45,
    Color? color,
    BorderRadiusGeometry? radius,
    Widget? widget,
    required Function onPress}) {
  return GestureDetector(
    onTap: () {
      onPress();
    },
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: radius == null ? BorderRadius.circular(15) : radius,
        color: color == null ? Color(0xFFFC94A0) : color,
      ),
      child: widget != null
          ? widget
          : Icon(
              Icons.add,
              color: Colors.white,
            ),
    ),
  );
}

Widget textWidget({
  required String text,
  required double font,
  FontWeight? weight,
  required Color color,
}) {
  return Text(
    text,
    style: TextStyle(fontSize: font, fontWeight: weight, color: color),
  );
}

Widget listWidget(
    {required int count,
    double? width,
    double? height,
    BorderRadiusGeometry? radius,
    Color? color,
    required BuildContext context,
    required IndexedWidgetBuilder builder}) {
  return Expanded(
    child: ListView.builder(
      itemCount: count,
      itemBuilder: builder,
    ),
  );
}

