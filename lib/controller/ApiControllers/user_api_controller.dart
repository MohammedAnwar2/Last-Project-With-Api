import 'dart:convert';
import 'package:get/get.dart';
import 'package:last_project_with_api/model/category_model.dart';
import 'package:last_project_with_api/model/count.dart';
import 'package:last_project_with_api/model/product_model.dart';
import 'package:http/http.dart'as http;
import 'package:last_project_with_api/model/user_model.dart';
class UserController extends GetxController {
  var isDataLoading = false.obs;

  Future<void> fetchUser(String type) async {
    var url = Uri.parse("https://api.escuelajs.co/api/v1/users");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var resposneData = jsonDecode(response.body);
      print(resposneData);
      CountsOfControllers.user =
          resposneData.map<UserModel>((json) => UserModel.fromJson(json))
              .toList();
      isDataLoading.value = true;
    }
    else {
      Get.snackbar("Error", "???");
    }

  }
  @override
  void onInit() {
    fetchUser("categories");
    super.onInit();
  }
}