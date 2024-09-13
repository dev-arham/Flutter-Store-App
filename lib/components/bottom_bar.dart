import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatefulWidget {
  final void Function(int)? onTabChange;
  const BottomBar({super.key, required this.onTabChange});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: BorderRadius.circular(40)),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: GNav(
          backgroundColor: Colors.transparent,
          color: Colors.grey[500],
          activeColor: Colors.red[800],
          iconSize: 25,
          padding: const EdgeInsets.all(12),
          tabBackgroundColor: Colors.white,
          gap: 5,
          onTabChange: (value) => widget.onTabChange!(value),
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
            ),
            GButton(
              icon: Icons.favorite_outline,
            ),
            GButton(
              icon: Icons.message_outlined,
            ),
            GButton(
              icon: Icons.person_2_outlined,
            ),
          ]),
    );
  }
}
