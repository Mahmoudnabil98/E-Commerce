import 'package:flutter/material.dart';
import 'package:flutter_shop/view/cart_view.dart';
import 'package:flutter_shop/view/home_view.dart';
import 'package:flutter_shop/view/profile_view.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue = 0;
  Widget currenView = HomeView();
   

   get navigatorValue => _navigatorValue;
   get currenViews => currenView;

   void chongeSelectedValue(int selectedValue){
     _navigatorValue = selectedValue;
     update();

     switch (selectedValue) {
            case 0:{
              currenView = HomeView();
              break;
            }
            case 1:{
            currenView = CartView();
            break;
            }
            case 2: {
            currenView = ProfileView();
            break;
            }
            
          
            
          }

   }

}