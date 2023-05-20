import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_project_with_api/constant/colorsConstant.dart';
import 'package:last_project_with_api/model/product_model.dart';
import 'package:last_project_with_api/screens/product_details_screen.dart';
import 'package:last_project_with_api/widget/transition_widget.dart';

class Feeds_Widget extends StatelessWidget {
   Feeds_Widget({Key? key,required this.producs}) : super(key: key);
  ProductModel producs;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color:Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(context,TransitionPage(screen:ProductScreen(id: producs.id.toString()) ,alignment: Alignment.center));
            //Get.to(()=>ProductScreen());
          },
          child: SizedBox(
            width: Get.width * 0.34,
            height: Get.height * .2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "\$",
                              style: TextStyle(
                                color: Color.fromRGBO(33, 150, 243, 1),
                              ),
                              children: <TextSpan>[
                            TextSpan(
                                text: producs.price.toString(),
                                style: TextStyle(color: lightTextColor)),
                          ])),
                      Icon(IconlyBold.heart)
                    ],
                  ),
                ),
                Flexible(
                    child:Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: FancyShimmerImage(
                            imageUrl: producs.images[0],
                            height: Get.height*.45,
                            width: Get.width*.45,
                            errorWidget: const Icon(IconlyBold.danger,color: Colors.red,size: 28,),
                          )),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(producs.title.toString(),
                      overflow: TextOverflow.ellipsis, maxLines: 2,style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )),
    );
  }
}
