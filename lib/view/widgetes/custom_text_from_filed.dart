import 'package:flutter/material.dart';
import '../widgetes/custom_text.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
 final String text;
 final Function onSave;
 final Function vildator;
 final TextInputType textInputType;
 final bool scureText;
  
 CustomTextFormFiled({this.vildator, this.hintText,this.text,this.onSave,this.textInputType ,this.scureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  CustomText(text: text, color:Colors.grey.shade900, fontSize: 14,alignment: Alignment.topLeft,),
                  TextFormField(
                  
                    onSaved: onSave,
                    validator: vildator,
                    keyboardType: textInputType,
                    obscureText: scureText,
                    decoration: InputDecoration(
                    hintText: hintText,hintStyle: TextStyle(color: Colors.black54),
                    fillColor: Colors.white
                    ),
                  ),
                  
                ],
              );
  }
}