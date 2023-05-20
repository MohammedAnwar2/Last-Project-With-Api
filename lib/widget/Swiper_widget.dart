import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_project_with_api/widget/sale_widget.dart';

class SwiperWidget extends StatelessWidget {
   SwiperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
        itemCount: 3,
        autoplay: true,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.white,
                activeColor:
                Theme.of(context).colorScheme.secondary)),
        itemBuilder: (context, index) => SaleWidget());
  }
}
