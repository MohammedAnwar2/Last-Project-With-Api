import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_project_with_api/controller/ApiControllers/user_api_controller.dart';
import 'package:last_project_with_api/model/count.dart';
import 'package:last_project_with_api/screens/home_screen.dart';
import 'package:last_project_with_api/widget/appBar_widget.dart';
import 'package:last_project_with_api/widget/transition_widget.dart';
import 'package:last_project_with_api/widget/users_widget.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({Key? key}) : super(key: key);
  UserController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarIcons(
            Icons: IconlyBold.arrowLeft,
            function: () {
              Navigator.pop(
                  context,
                  TransitionPage(
                      screen: HomeScreen(), alignment: Alignment.topRight));
            }),
        title: Text("All Users",
            style:
                GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: Obx(() => controller.isDataLoading == true
          ? ListView.builder(
              itemCount: CountsOfControllers.user.length,
              itemBuilder: (context, index) {
                var user =CountsOfControllers.user[index];
                return UsersWidget(users:user);
              })
          : const Center(
              child: CircularProgressIndicator(),
            )),
    );
  }
}

/*
 Obx(() =>controller.isDataLoading.value==false?Center(child: CircularProgressIndicator()):GridView.builder(
        itemCount: CountProduct.product.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          var products = CountProduct.product[index];
          return Feeds_Widget(producs: products,);
        },))

* */
