import 'dart:convert';
import 'package:get/get.dart';
import 'package:last_project_with_api/model/category_model.dart';
import 'package:last_project_with_api/model/count.dart';
import 'package:last_project_with_api/model/product_model.dart';
import 'package:http/http.dart'as http;
class CategoryController extends GetxController {
  var isDataLoading = false.obs;

  Future<void> fetchCategory(String type) async {
    var url = Uri.parse("https://api.escuelajs.co/api/v1/categories");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var resposneData = jsonDecode(response.body);
      print(resposneData[0][1]);
      CountsOfControllers.category =
          resposneData.map<CategoryModel>((json) => CategoryModel.fromJson(json))
              .toList();
      isDataLoading.value = true;
    }
    else {
      Get.snackbar("Error", "???");
    }

  }
  @override
  void onInit() {
    fetchCategory("categories");
    super.onInit();
  }
}