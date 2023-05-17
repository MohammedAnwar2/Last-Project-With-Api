import 'package:get/get.dart';
import 'package:last_project_with_api/pages/homePage.dart';

List<GetPage<dynamic>> route = [
  GetPage(name: AppRoute.HomePage,page: () => HomePage(),),
];

class AppRoute {
  static const String HomePage = "/";

}