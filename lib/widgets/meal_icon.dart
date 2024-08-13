import 'package:flutter/material.dart';

class MealIcon extends StatelessWidget {
  const MealIcon({super.key, required this.iconCardX, required this.textX});

  final IconData iconCardX;
  final String textX;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
         Icon(iconCardX),
        const SizedBox(width: 6),
        Text(textX),
      ],
    );
  }
}
