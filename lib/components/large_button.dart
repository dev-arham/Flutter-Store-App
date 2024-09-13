import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  const LargeButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red[800]),
            onPressed: onTap,
            child: Text(
              buttonText,
              style: TextStyle(
                  color: Colors.grey[50],
                  fontSize: 18,
                  fontFamily: "main_font",
                  letterSpacing: 1),
            ),
          ),
        ],
      ),
    );
  }
}
