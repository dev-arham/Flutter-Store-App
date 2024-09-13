import 'package:flutter/material.dart';
import '../components/large_button.dart';
import '../components/circle_image.dart';
import './main_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/official-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Hi Welcome back, you've been missed",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "someone@email.com",
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
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                  ],
                ),
                TextField(
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
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
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined),
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
                LargeButton(
                    buttonText: "Sign In",
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MainPage()));
                    }),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "Or sign in with",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleImage(
                      imagePath: "assets/images/apple-logo-100.png",
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CircleImage(
                      imagePath: "assets/images/google-logo-100.png",
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CircleImage(
                      imagePath: "assets/images/facebook-logo-100.png",
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MainPage()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "main_font",
                            letterSpacing: 1,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
