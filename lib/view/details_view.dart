import 'package:flutter/material.dart';
import 'package:flutter_shop/constance.dart';
import 'package:flutter_shop/core/view_model/cart_view_model.dart';
import 'package:flutter_shop/model/cart_prodauct_model.dart';
import 'package:flutter_shop/model/products_model.dart';
import 'package:flutter_shop/view/widgetes/custom_button.dart';
import 'package:flutter_shop/view/widgetes/custom_text.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  final ProductModel productModel;
  DetailsView({this.productModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 270,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                productModel.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: productModel.name,
                        alignment: Alignment.bottomLeft,
                        fontSize: 26,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(text: 'Size'),
                                  Container(
                                      child: CustomText(
                                    text: productModel.sized,
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(top: 8),
                                    child: CustomText(text: 'Color')),
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: productModel.color,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.grey.shade200)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomText(
                        text: 'Details',
                        fontSize: 18,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(),
                          child: CustomText(
                            text: productModel.descripition,
                            fontSize: 14,
                            height: 2,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                  children: [
                    CustomText(text: 'PRICE',color: Colors.grey,fontSize: 22,),
                    SizedBox(height:20),
                    CustomText(text:  '\$${productModel.price}',color: primaryColor,fontSize: 18,)
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller) => Container(
                    width: 180,
                    height: 100,
                    padding: EdgeInsets.all(20),
                    child: CustomButton(

                      text: 'ADD', onPressed: controller.addProduct(
                          CartProductModel(
                          name: productModel.name,
                          image: productModel.image,
                          price: productModel.price,
                          quantity: 1
                          ),
                        ),
                        
                        )),
                ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
