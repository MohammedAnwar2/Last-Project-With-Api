import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_project_with_api/constant/colorsConstant.dart';
import 'package:last_project_with_api/model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({required this.category, Key? key})
      : super(key: key);
  CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.loose,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: category.image.toString(),
                height: Get.height*.45,
                width: Get.width*.45,
                errorWidget: const Icon(IconlyBold.danger,color: Colors.red,size: 28,),
              )),
          Align(
              alignment: Alignment.center,
              child: Text(category.name.toString(),
                  style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      backgroundColor: lightCardColor.withOpacity(.5))))
        ],
      ),
    );
  }
}
