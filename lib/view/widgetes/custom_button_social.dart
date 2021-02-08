import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomButtonScol extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPressed;
  CustomButtonScol({this.text,this.imageName,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade100),
      child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)),
              onPressed: onPressed, child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(imageName, width: 20, height: 20,fit: BoxFit.cover,),
                  SizedBox(width: 90,),
                  CustomText(text: text),
                ],
              ),),
      
    );
  }
}