import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/shop.dart';
import './pages/splash_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[100],
          primaryColor: Colors.red,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
          )),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
