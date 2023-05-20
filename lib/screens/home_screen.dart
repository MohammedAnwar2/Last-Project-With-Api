import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_project_with_api/controller/ApiControllers/product_api_controller.dart';
import 'package:last_project_with_api/screens/category_screen.dart';
import 'package:last_project_with_api/screens/feeds_screen.dart';
import 'package:last_project_with_api/screens/users_screen.dart';
import 'package:last_project_with_api/widget/Swiper_widget.dart';
import 'package:last_project_with_api/widget/appBar_widget.dart';
import 'package:last_project_with_api/widget/feeds_grids.dart';
import 'package:last_project_with_api/widget/search_widget.dart';
import 'package:last_project_with_api/widget/transition_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  ProductController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarIcons(
            Icons: IconlyBold.category,
            function: () {
              Navigator.push(context, TransitionPage(
                  screen: CategoryScreen(), alignment: Alignment.topLeft));
            },
          ),
          title: const Text("Home"),
          centerTitle: true,
          actions: [
            AppBarIcons(
              Icons: IconlyBold.user3,
              function: () {
                Navigator.push(context, TransitionPage(
                    screen: UsersScreen(), alignment: Alignment.topRight));
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Search(),
                SizedBox(height: 2,),
                Flexible(
                  child: ListView(
                    children: [
                      SizedBox( //عند استخدام ال siper لازم نحدد له طوول ولا راح يطلع خطأ
                          height: Get.width * 0.5,
                          child: SwiperWidget()
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: Get.height * .03),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("All Products", style: GoogleFonts.asap(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    end: Get.width * .07),
                                child: GestureDetector(onTap: () {
                                  Navigator.push(context, TransitionPage(
                                      screen: FeedsScreen(),
                                      alignment: Alignment.centerRight));
                                }, child: Icon(IconlyBold.arrowRight),),
                              )
                            ]),
                      ),
                      FeedsGrids(),
//--------
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
