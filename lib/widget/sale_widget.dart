import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class SaleWidget extends StatelessWidget {
  const SaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: Get.width,
        height: Get.height * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              colors: [Color(0xff7A60A5), Color(0xff82C3DF)],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              //  stops: [0.0,0.1],
              // tileMode: TileMode.clamp
            )),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                width: Get.width * 0.32,
                height: Get.height * 0.17,
                decoration: BoxDecoration(
                    color:Color(0xff9689CE),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Get the special discount",
                        style: GoogleFonts.asap(color: Theme
                            .of(context)
                            .cardColor),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SizedBox(
                          width: Get.width,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              "50 %\nOFF",
                              style: GoogleFonts.asap(color: Theme
                                  .of(context)
                                  .cardColor,  fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(flex: 3,
              child:Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network("https://i.ibb.co/vwB46Yq/shoew.png",width: double.infinity),
              )
          
          )
        ]),
      ),
    );
  }
}
