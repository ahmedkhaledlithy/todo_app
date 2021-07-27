import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
 final String text;
 final double font;
 final Color color;
 final FontWeight weight;
  const InputTitle({Key? key,required this.text,required this.font,required this.color,required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Text(
      text,
      style: TextStyle(
          color:color ,
          fontSize:font ,
          fontWeight:weight ),
    );
  }
}
