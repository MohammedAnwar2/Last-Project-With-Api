import 'package:get/get.dart';
import 'package:last_project_with_api/controller/textController.dart';

class MyBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put(TextController(),permanent: true);
  }

}