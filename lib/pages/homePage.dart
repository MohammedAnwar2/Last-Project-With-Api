import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:last_project_with_api/widget/appBar_widget.dart';
import 'package:last_project_with_api/widget/sale_widget.dart';
import 'package:last_project_with_api/widget/search_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarIcons(
            Icons: IconlyBold.category,
            function: () {},
          ),
          title: const Text("Home"),
          centerTitle: true,
          actions: [
            AppBarIcons(
              Icons: IconlyBold.user3,
              function: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Flexible(child: Search()),
            Flexible(child: SaleWidget()),

          ]),
        ),
      ),
    );
  }
}
