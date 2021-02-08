import 'package:flutter/material.dart';

class SacondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),

              ),
              child: CircleAvatar(
                child: Image.asset('assets/images/Facebook.png',
                width: 50,height: 50, fit: BoxFit.cover,),

              ),)
          ],
        ),
      ),
    );
  }
}
