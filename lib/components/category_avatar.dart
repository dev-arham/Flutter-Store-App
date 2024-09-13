import 'package:flutter/material.dart';

class CategoryAvatar extends StatelessWidget {
  final String imagePath;
  final String text;
  final void Function() onTap;
  const CategoryAvatar(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.red[100],
            child: Image.asset(
              imagePath,
              color: Colors.red[900],
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "main_font",
                letterSpacing: 1),
          )
        ],
      ),
    );
  }
}
