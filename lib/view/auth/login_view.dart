import 'package:flutter/material.dart';
import 'package:flutter_shop/core/view_model/auth_view_model.dart';
import 'package:get/get.dart';
import '../widgetes/custom_button.dart';
import '../widgetes/custom_button_social.dart';
import '../widgetes/custom_text.dart';
import '../widgetes/custom_text_from_filed.dart';
import 'register_view.dart';

import '../../constance.dart';

class LoginView extends GetWidget<AuthViewModel> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      fontSize: 30,
                      text: 'Welcome',
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterView());
                      
                      },
                                          child: CustomText(
                        text: 'Sign Up',
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      color: Colors.grey,
                      text: 'Sign in to continue ',
                      fontSize: 14,
                    )),
                SizedBox(height: 30),
                CustomTextFormFiled(
                  text: 'Email',
                  hintText: 'Nam***@Email.com',
                  vildator: (value) {
                    if(value == null){
                      print('enter email !');
                    }
                  },
                  onSave: (value) {
                    controller.email = value;
                  },
                ),
                SizedBox(height: 40),
                CustomTextFormFiled(
                  text: 'Password',
                  hintText: '************',
                  vildator: (value) {
                    if(value == null){
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
                CustomText(
                  text: "Forgot Password ?",
                  alignment: Alignment.topRight,
                  color: Colors.grey,
                  fontSize: 14,
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: "Sign In",
                  onPressed: (){
                    _globalKey.currentState.save();
                    if(_globalKey.currentState.validate()){
                      controller.signInWithEmailAndPassword();
                      
                    }
                    
                  },
                ),
                SizedBox(height: 20),
                CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                SizedBox(height: 40),
                CustomButtonScol(
                  text: 'Sign in with Google',
                  imageName: 'assets/images/Google.png',
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                ),
                SizedBox(height: 40),
                CustomButtonScol(
                  text: 'Sign in with Facebook',
                  imageName: 'assets/images/Facebook.png',
                  onPressed: () {
                    controller.facebookSignInMethod();
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
