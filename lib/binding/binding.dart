import 'package:get/get.dart';
import 'package:last_project_with_api/controller/ApiControllers/category_api_controller.dart';
import 'package:last_project_with_api/controller/ApiControllers/product_api_controller.dart';
import 'package:last_project_with_api/controller/ApiControllers/user_api_controller.dart';
import 'package:last_project_with_api/controller/textController.dart';

class MyBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(()=>TextController(),fenix: true);
    Get.lazyPut(()=>ProductController(),fenix: true);
    Get.lazyPut(()=>CategoryController(),fenix: true);
    Get.lazyPut(()=>UserController(),fenix: true);
  }

}