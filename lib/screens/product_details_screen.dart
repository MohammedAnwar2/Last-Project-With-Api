import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_project_with_api/controller/ApiControllers/product_api_controller.dart';
import 'package:last_project_with_api/model/product_model.dart';
import 'package:last_project_with_api/screens/feeds_screen.dart';
import 'package:last_project_with_api/widget/appBar_widget.dart';
import 'package:last_project_with_api/widget/transition_widget.dart';

class ProductScreen extends StatefulWidget {

   ProductScreen({Key? key, required this.id}) : super(key: key);
   final String id;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductController controller =Get.find();
  ProductModel?productModel;
  Future<void> getProduct()async{
     productModel=await ProductController.getProductById(id: widget.id);
     setState((){});
  }
  @override
  void didChangeDependencies()
  {
    getProduct();
    super.didChangeDependencies();
  }
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
                    screen: FeedsScreen(), alignment: Alignment.topLeft));
          },
        ),
      ),
      body:productModel==null?Center(child: CircularProgressIndicator(),):SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text(productModel!.category.name.toString(),
                    style: GoogleFonts.asap(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(productModel!.title.toString(),
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
                                  text: productModel?.price.toString(),
                                  style: GoogleFonts.asap(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87)),
                            ]))
                  ],
                ),
                SizedBox(height: Get.height*.02),
                SizedBox(
                  //عند استخدام ال siper لازم نحدد له طوول ولا راح يطلع خطأ
                  height: Get.height * .4,
                  child: Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: FancyShimmerImage(
                            imageUrl:productModel!.images[index].toString(),
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
                SizedBox(height: Get.height*.03),
                Text(
                  "Discription",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  productModel!.description,
                  style: GoogleFonts.aBeeZee(fontSize: 20),
                )
              ],
            ),
          ))
    );
  }
}





/*
FutureBuilder(future:ProductController.getProductById(id: widget.id) ,
      builder: (context,AsyncSnapshot snapshot) {
        ProductModel productModel = snapshot.data;
        if(snapshot.hasData)
          return ProductWidget(productModel: productModel,);
        else
          return CircularProgressIndicator();
      },
      )


* */