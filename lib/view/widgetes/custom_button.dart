import 'package:flutter/material.dart';
import '../widgetes/custom_text.dart';

import '../../constance.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  CustomButton({this.text , this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
     child: FlatButton(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(18),
              onPressed: onPressed,
              child: CustomText(
                text: text,
                color: Colors.white,
                alignment: Alignment.center,
              ),
              color: primaryColor,
              

            ),
      
    );
  }
}