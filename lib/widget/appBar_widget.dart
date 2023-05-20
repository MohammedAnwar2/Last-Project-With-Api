import 'package:flutter/material.dart';
class AppBarIcons extends StatelessWidget {
  const AppBarIcons({required this.Icons, required this.function, Key? key})
      : super(key: key);
  final IconData Icons;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: function,
        child: Container(
         decoration: BoxDecoration(
           color: Theme.of(context).cardColor,
           shape: BoxShape.circle,
         ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(Icons),
          ),
        ),
      ),
    );
  }
}
