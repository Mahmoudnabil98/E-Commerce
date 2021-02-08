import 'package:flutter/material.dart';
import 'package:flutter_shop/constance.dart';
import 'package:flutter_shop/view/widgetes/custom_button.dart';
import 'package:flutter_shop/view/widgetes/custom_text.dart';
import 'package:get/get.dart';
import '../core/view_model/cart_view_model.dart';


class CartView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: CartViewModel(),
                builder:(controller) => Container(
                child: ListView.separated(
                  itemCount: controller.cartProductModlel.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 140,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                              ),
                              width: 140,
                              child: Image.network(
                                
                                controller.cartProductModlel[index].image,
                                fit: BoxFit.fill,
                              
                              )
                              ),
                          Container(
                            padding: EdgeInsets.only(left: 30, top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.cartProductModlel[index].name,
                                  fontSize: 24,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: CustomText(
                                      text: '\$${controller.cartProductModlel[index].price.toString()}',
                                      color: primaryColor),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   color: Colors.grey.shade200, 
                                  ),
                                  width: 140,
                                  
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add, color: Colors.black),
                                      SizedBox(width: 20),
                                      CustomText(
                                          text: '__',
                                          alignment: Alignment.center,
                                          fontSize: 20,
                                          color: Colors.black),
                                      SizedBox(width: 20),
                                      Container(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: Icon(Icons.minimize,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 15);
                  },
                ),
              ),
            ),
          ),
        
        Container(
          padding: EdgeInsets.only(left:30,right:30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
            Column(children: [
              CustomText(text:'TOTAL',fontSize: 22,),
              SizedBox(height:15),
            Container(
              padding: EdgeInsets.all(5),
              child: CustomText(text:'\$'.toString(),color: primaryColor,fontSize: 18,)),
            ],),
            Container(
              height: 100,
              padding: EdgeInsets.all(20),
              width: 180,
              child: CustomButton(onPressed: (){}, text: 'CHECKOUT',),)
          ],),
        )
        ],
      ),
    );
  }
}
