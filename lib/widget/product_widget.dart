import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_project_with_api/model/product_model.dart';

class ProductWidget extends StatelessWidget {
   ProductWidget( {required this.productModel,Key? key}) : super(key: key);
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text("",
                  style: GoogleFonts.asap(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(productModel.title,
                      style: GoogleFonts.asap(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  RichText(
                      text: TextSpan(
                          text: "\$",
                          style: GoogleFonts.asap(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color.fromRGBO(33, 150, 243, 1)),
                          children: [
                            TextSpan(
                                text: productModel.price.toString(),
                                style: GoogleFonts.asap(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                          ]))
                ],
              ),
              SizedBox(
                //عند استخدام ال siper لازم نحدد له طوول ولا راح يطلع خطأ
                height: Get.height * .4,
                child: Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FancyShimmerImage(
                          imageUrl:productModel.images[index].toString(),
                          height: Get.height*.15,
                          width: Get.width*.15,
                          errorWidget: const Icon(IconlyBold.danger,color: Colors.red,size: 28,),
                        ));/*Image.network(
                    "https://i.ibb.co/vwB46Yq/shoew.png",
                    fit: BoxFit.fill,
                  );*/
                  },
                  itemCount: 3,
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white,
                          activeColor: Theme.of(context).colorScheme.secondary)),
                ),
              ),
              Text(
                "Discription",
                style: GoogleFonts.aBeeZee(
                    fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                productModel.description,
                style: GoogleFonts.aBeeZee(fontSize: 20),
              )
            ],
          ),
        ));
  }
}
