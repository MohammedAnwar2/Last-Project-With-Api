import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_project_with_api/binding/binding.dart';
import 'package:last_project_with_api/configration/theme.dart';
import 'package:last_project_with_api/routes/route.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  MyBinding().dependencies();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeScreens().theme,
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      initialRoute: "/",
      getPages: route,
    );
  }
}
