
import 'package:flutter/material.dart';
import 'package:flutter_shop/helper/extension_color.dart';

class ProductModel{

  String name,price,image,sized,descripition;
 Color color;

  ProductModel({this.name,this.price,this.image,this.color,this.descripition,this.sized});

  ProductModel.fromJson(Map<dynamic,dynamic> map){
    if(map ==null ){
      return ;
    }
    name = map['name'];
    price =map['price'];
    image =map['image'];
    color = HexColor.fromHex(map['color']);
    descripition = map['descripition'];
    sized = map['sized'];

  }
  toJosn(){
    return {
      'name' : name ,
      'price' : price ,
      'image' : image ,
      'color' : color ,
      'descripition' : descripition ,
      'sized' : sized ,

    };

  }

}