import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:last_project_with_api/controller/ApiControllers/product_api_controller.dart';
import 'package:last_project_with_api/model/count.dart';
import 'package:last_project_with_api/screens/home_screen.dart';
import 'package:last_project_with_api/widget/appBar_widget.dart';
import 'package:last_project_with_api/widget/feeds_widget.dart';
import 'package:last_project_with_api/widget/transition_widget.dart';

class FeedsScreen extends StatelessWidget {
    FeedsScreen({Key? key}) : super(key: key);
   ProductController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("All Products"),
        leading: AppBarIcons(Icons: IconlyBold.arrowLeft, function: (){
          Navigator.pop(context,TransitionPage(screen:HomeScreen(),alignment: Alignment.centerLeft));
        },),
      ),
      body:Obx(() =>controller.isDataLoading.value==false?Center(child: CircularProgressIndicator()):GridView.builder(
        itemCount: CountsOfControllers.product.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          var products = CountsOfControllers.product[index];
          return Feeds_Widget(producs: products,);
        },))



       // FeedsGrids(check: false,physics: BouncingScrollPhysics(),count: 0),


    );
  }
}



/**/