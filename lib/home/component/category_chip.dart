import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final String iconPath;

  const CategoryChip({
    Key? key,
    required this.label,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Chip(
        avatar: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFB1D0E0)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(iconPath, width: 30, height: 30),
            )),
        label: Text(label),
        backgroundColor: Colors.white,
      ),
    );
  }
}
