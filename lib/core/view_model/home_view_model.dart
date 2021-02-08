import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/core/services/home_services.dart';
import 'package:flutter_shop/model/products_model.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loadingNotifire => _loading;
 final List<CategoryModel> categoryModel=[];
 List<CategoryModel> get categorymodel=> categoryModel;


 final List<ProductModel> _productModel =[];
 List<ProductModel> get getProductModel {
   return _productModel;
 }

  
  
  HomeViewModel(){
    getCategory();
    getBestSellingProducts();
    
  }
  
  getCategory()async{
    _loading.value= true;
    HomeServices().getCategory().then((value) {
     for(int i = 0 ; i <value.length;i++){
       categoryModel.add(CategoryModel.formjson(value[i].data()));
      // print(categoryModel.length);
       _loading.value = false;
     }
     update();
    });
  }

  getBestSellingProducts()async{
    _loading.value = true;
    HomeServices().getBestSelling().then((value) {
      for(int i=0 ;i< value.length; i++ ){
        _productModel.add(ProductModel.fromJson(value[i].data()));
        print(_productModel.length);
        _loading.value = false;

      }

      update();

    });
  }



}