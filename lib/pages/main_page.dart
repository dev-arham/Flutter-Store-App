import 'package:flutter/material.dart';
import 'package:store_app/pages/shop_page.dart';
import './home_page.dart';
import './wishlist_page.dart';
import './chat_page.dart';
import './profile_page.dart';
import '../components/bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  void navigatebar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = const [
    HomePage(),
    ShopPage(),
    WishlistPage(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomBar(
        onTabChange: (int index) => navigatebar(index),
      ),
      body: pages[selectedIndex],
    );
  }
}
