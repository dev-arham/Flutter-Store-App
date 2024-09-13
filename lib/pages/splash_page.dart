import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './intro_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(
        const Duration(seconds: 3),
        context.mounted
            ? () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const IntroPage()),
                );
              }
            : null);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/official-bg.png"),
              fit: BoxFit.cover),
        ),
        child: Image.asset("assets/images/outfitters-logo.png"),
      ),
    );
  }
}
