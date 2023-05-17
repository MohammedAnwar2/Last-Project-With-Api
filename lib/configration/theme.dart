import 'package:flutter/material.dart';
import 'package:last_project_with_api/constant/colorsConstant.dart';

class ThemeScreens
{
  ThemeData theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightScaffoldColor,
    primaryColor: lightCardColor,
    backgroundColor: lightBackgroundColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: lightIconsColor,
      ),
      backgroundColor: lightScaffoldColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
      elevation: 0,
    ),
    iconTheme: IconThemeData(
      color: lightIconsColor,
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.blue,
    ),
    cardColor: lightCardColor,
    brightness: Brightness.light,
    colorScheme: ThemeData().colorScheme.copyWith(
      secondary: lightIconsColor,
      brightness: Brightness.light,
    ),
  );
}

