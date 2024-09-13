import 'package:flutter/material.dart';
import '../components/large_button.dart';
import './onboarding_page.dart';
import './signin_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/official-bg.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.asset("assets/images/img1.png"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Image.asset(
                          "assets/images/img2.png",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Image.asset("assets/images/img3.png"),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "main_font",
                        letterSpacing: 1),
                    children: <TextSpan>[
                      const TextSpan(text: "The "),
                      TextSpan(
                        text: "Fashion App ",
                        style: TextStyle(color: Colors.red[800]),
                      ),
                      const TextSpan(text: "That Makes You Look Your Best"),
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vestibulum placerat.",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontFamily: "main_font",
                  letterSpacing: 1),
              textAlign: TextAlign.center,
            ),
            LargeButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const OnboardingPage()),
                );
              },
              buttonText: "Get Started",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Alredy have an account? ",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SigninPage()));
                  },
                  child: Text(
                    "Sign In",
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
    );
  }
}
