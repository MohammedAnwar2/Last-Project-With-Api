import 'package:flutter/material.dart';
import 'package:last_project_with_api/screens/feeds_screen.dart';


PageRouteBuilder TransitionPage({required Widget screen,required Alignment alignment})
{
  return PageRouteBuilder( transitionDuration: Duration(milliseconds: 300),transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return ScaleTransition(scale: animation,alignment: alignment, child: child);
  }, pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return  screen;
  },);
}