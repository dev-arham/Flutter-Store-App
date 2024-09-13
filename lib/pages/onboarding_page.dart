import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './onboarding_screens/screen1.dart';
import './onboarding_screens/screen2.dart';
import './onboarding_screens/screen3.dart';
import './signin_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController onboardingPageController = PageController();
  bool showBackButton = false;
  bool showForwardButton = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/official-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            PageView(
              controller: onboardingPageController,
              onPageChanged: (index) {
                if (index == 0) {
                  showBackButton = false;
                } else {
                  showBackButton = true;
                }
                if (index == 2) {
                  showForwardButton = false;
                } else {
                  showForwardButton = true;
                }
                setState(() {});
              },
              children: const [
                Screen1(
                  skipButton: "Skip",
                ),
                Screen2(
                  skipButton: "Skip",
                ),
                Screen3(
                  skipButton: "",
                ),
              ],
            ),
            Container(
                alignment: const Alignment(0, 0.85),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    showBackButton
                        ? GestureDetector(
                            onTap: () {
                              onboardingPageController.previousPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black)),
                              child: const Icon(
                                Icons.arrow_back_outlined,
                                size: 20,
                              ),
                            ),
                          )
                        : const SizedBox(
                            width: 40,
                          ),
                    SmoothPageIndicator(
                      controller: onboardingPageController,
                      count: 3,
                      effect: ColorTransitionEffect(
                          activeDotColor: Colors.red.shade800),
                    ),
                    showForwardButton
                        ? GestureDetector(
                            onTap: () {
                              onboardingPageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.red[800],
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.red.shade800)),
                              child: const Icon(
                                Icons.arrow_forward_outlined,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SigninPage()));
                            },
                            child: Text(
                              "Finish",
                              style: TextStyle(
                                  color: Colors.red[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: "main_font",
                                  letterSpacing: 1),
                            ),
                          ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
