import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  const SmallButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.red[800]),
        onPressed: onTap,
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.grey[50],
              fontSize: 14,
              fontFamily: "main_font",
              letterSpacing: 1),
        ),
      ),
    );
  }
}
