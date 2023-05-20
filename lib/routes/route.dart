import 'package:get/get.dart';
import 'package:last_project_with_api/screens/feeds_screen.dart';
import 'package:last_project_with_api/screens/home_screen.dart';


List<GetPage<dynamic>> route = [
  GetPage(name: AppRoute.HomePage,page: () => HomeScreen(),),
  GetPage(name: AppRoute.FeedsScreen,page: () =>  FeedsScreen(),),
];

class AppRoute {
  static const String HomePage = "/";
  static const String FeedsScreen = "/feedsScreen";

}