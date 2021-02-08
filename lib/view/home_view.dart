import 'package:flutter/material.dart';
import 'package:flutter_shop/constance.dart';
import 'package:flutter_shop/core/view_model/home_view_model.dart';
import 'package:flutter_shop/view/details_view.dart';
import 'package:flutter_shop/view/widgetes/custom_text.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loadingNotifire.value
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: primaryColor,
            ))
          : Scaffold(
              body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: [
                    _serachFormField(),
                    SizedBox(height: 30),
                    CustomText(
                      text: 'Catagories',
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 30),
                    _listViewCatagory(),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Best Selling',
                          fontSize: 18,
                        ),
                        CustomText(text: 'See all', fontSize: 16),
                      ],
                    ),
                    SizedBox(height: 30),
                    _listViewProducts(),
                  ],
                ),
              ),
            )),
    );
  }

  Widget _serachFormField() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCatagory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categorymodel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Image.network(controller.categoryModel[index].image),
                    )),
                SizedBox(height: 20),
                CustomText(
                  text: controller.categoryModel[index].name,
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 20);
          },
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.getProductModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(
                  productModel: controller.getProductModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      ),
                      child: Image.network(
                        controller.getProductModel[index].image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: controller.getProductModel[index].name,
                      height: 1,
                      fontSize: 18,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: CustomText(
                        height: 1,
                        text: controller.getProductModel[index].descripition,
                        color: Colors.grey,
                        fontSize: 14,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text:
                          '\$${controller.getProductModel[index].price.toString()}',
                      color: primaryColor,
                      fontSize: 18,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 20);
          },
        ),
      ),
    );
  }
}
