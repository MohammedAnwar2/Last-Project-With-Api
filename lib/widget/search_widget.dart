import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import '../controller/textController.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  TextController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GetBuilder<TextController>(builder: (logic) {
        return TextField(
          onSubmitted: (value) {
            controller.changeTheValue(value);
          },
          decoration: InputDecoration(
            fillColor: Theme
                .of(context)
                .cardColor,
            filled: true,
            hintText: "Search",
            suffixIcon: InkWell(
                onTap: () {},
                child: Icon(
                  IconlyLight.search,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .secondary,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme
                    .of(context)
                    .colorScheme
                    .secondary)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        );
      }),
    );
  }
}
