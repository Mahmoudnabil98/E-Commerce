import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/core/services/database/cart_database_helper.dart';
import 'package:flutter_shop/model/cart_prodauct_model.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{

  CartViewModel(){
    getAllProduct();
  }



  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModlel =[];
  List<CartProductModel> get cartProductModlel => _cartProductModlel;

  getAllProduct()async{
    _loading.value =true;
    var dbHelper = CartDatabaseHelper.db;
    print(_cartProductModlel.length);
    _cartProductModlel = await dbHelper.getAllProduct();
    _loading.value = false;
    update();


  }


 addProduct(CartProductModel cartProductModel)async{

   var dbHelper = CartDatabaseHelper.db;

   await dbHelper.insert(cartProductModel);
   update();




 }

}