import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imagePath;
  final void Function()? onTap;
  const CircleImage({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}
