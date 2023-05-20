import 'dart:convert';

import 'package:get/get.dart';
import 'package:last_project_with_api/model/count.dart';
import 'package:last_project_with_api/model/product_model.dart';
import 'package:http/http.dart'as http;
class ProductController extends GetxController {
  var isDataLoading = false.obs;
  static var IsDataLoading = false.obs;

  Future<void> fetchProduct(String type) async {
    var url = Uri.parse("https://api.escuelajs.co/api/v1/$type");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var resposneData = jsonDecode(response.body);
      CountsOfControllers.product =
          resposneData.map<ProductModel>((json) => ProductModel.fromJson(json))
              .toList();
      isDataLoading.value = true;
    }
    else {
      Get.snackbar("Error", "???");
    }

  }


  static Future<dynamic> getProductById({required String id}) async {
    var url = Uri.parse("https://api.escuelajs.co/api/v1/products/$id");
    var response = await http.get(url);
    int ?value ;
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
           IsDataLoading.value = true;
        return ProductModel.fromJson(data);
    }
    else {
      Get.snackbar("Error", "???");
    }
  }

  @override
  void onInit() {
    fetchProduct("products");
   // getProductById(id: '4');
    super.onInit();
  }
}