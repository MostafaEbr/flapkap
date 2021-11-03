import 'package:flapkap/components/widgets/default_text.dart';
import 'package:flutter/material.dart';

class RowContainer extends StatelessWidget {

  final String? text ,text1,text2;
  final  Color? textColor;
  final  double? textSize ;
  const RowContainer({Key? key,this.text ,this.text1,this.text2 ,this.textColor = Colors.blueGrey ,this.textSize =14}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text:text,
          textColor: textColor,
          textSize: textSize,
        ),
        DefaultText(
          text: text1,
          textColor:textColor,
          textSize: textSize,
        ),
        DefaultText(
          text: text2,
          textColor: textColor,
          textSize: textSize,
        ),

      ],
    );
  }
}
