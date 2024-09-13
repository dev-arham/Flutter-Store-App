import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title, imagePath;
  const CategoryCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red[200],
          ),
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            imagePath,
            color: Colors.red[900],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.grey[800],
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: "main_font",
              letterSpacing: 1),
        )
      ],
    );
  }
}
