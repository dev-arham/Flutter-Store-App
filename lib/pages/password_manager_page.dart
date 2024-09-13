import 'package:flutter/material.dart';

class PasswordManagerPage extends StatelessWidget {
  const PasswordManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text(
          "Password Manager",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: "main_font",
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Current Password",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontFamily: "main_font",
                        letterSpacing: 1),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.visibility_off),
                  hintText: "********",
                  hintStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.red.shade800, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.red[800],
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "New Password",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontFamily: "main_font",
                        letterSpacing: 1),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.visibility_off),
                  hintText: "********",
                  hintStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.red.shade800, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Confirm New Password",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontFamily: "main_font",
                        letterSpacing: 1),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.visibility_off),
                  hintText: "********",
                  hintStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.red.shade800, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
