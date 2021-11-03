import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {

  final String? text ;
  final  Color? textColor ;
  final  double? textSize ;
  const DefaultText({Key? key,this.text,this.textColor ,this.textSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,style: TextStyle(
        color: textColor,
        fontSize: textSize
    ),);
  }
}
