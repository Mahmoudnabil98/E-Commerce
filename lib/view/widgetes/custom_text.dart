import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final int maxLine;
  final double height;


  CustomText(
      {this.text = ' ',
      this.color = Colors.black,
      this.fontSize = 16,
      this.alignment,
      this.maxLine,
      this.height =0,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: fontSize,height: height),
        maxLines: maxLine,
      ),
    );
  }
}
