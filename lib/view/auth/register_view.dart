import 'package:flutter/material.dart';
import 'package:flutter_shop/core/view_model/auth_view_model.dart';
import 'package:flutter_shop/view/widgetes/custom_button.dart';
import 'package:flutter_shop/view/widgetes/custom_text.dart';
import 'package:flutter_shop/view/widgetes/custom_text_from_filed.dart';
import 'package:get/get.dart';


class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                CustomText(
                  alignment: Alignment.topLeft,
                  fontSize: 30,
                  text: 'Sign Up',
                ),
                SizedBox(height: 30),
                CustomTextFormFiled(
                  textInputType: TextInputType.text,
                  text: 'Name',
                  hintText: 'Name',
                  vildator: (value) {
                    if (value == null) {
                      print('enter name !');
                    }
                  },
                  onSave: (value) {
                    controller.name = value;
                  },
                ),
                SizedBox(height: 40),
                CustomTextFormFiled(
                  textInputType: TextInputType.emailAddress,
                  text: 'Email',
                  hintText: '*****@Email.com',
                  vildator: (value) {
                    if (value == null) {
                      print('enter email !');
                    }
                  },
                  onSave: (value) {
                    controller.email = value;
                  },
                ),
                SizedBox(height: 40),
                CustomTextFormFiled(
                  scureText: true,
                  textInputType: TextInputType.visiblePassword,
                  text: 'Password',
                  hintText: '************',
                  vildator: (value) {
                    if (value == null) {
                      print('enter password !');
                    }
                  },
                  onSave: (value) {
                    controller.password = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: "Sign Up",
                  onPressed: () {
                    _globalKey.currentState.save();
                    if (_globalKey.currentState.validate()) {
                      controller.createAccuntWithEmailAndPassword();
                    }
                  },
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
