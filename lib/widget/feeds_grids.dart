import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_project_with_api/controller/ApiControllers/product_api_controller.dart';
import 'package:last_project_with_api/model/count.dart';
import 'package:last_project_with_api/widget/feeds_widget.dart';

class FeedsGrids extends StatelessWidget {
   FeedsGrids({Key? key}) : super(key: key);

   ProductController controller = Get.find();
   @override
  Widget build(BuildContext context) {
    return Obx(() =>controller.isDataLoading.value==false?Center(child: CircularProgressIndicator()):GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        var products = CountsOfControllers.product[index];
        return Feeds_Widget(producs: products,);
      },))
    ;
  }
}
