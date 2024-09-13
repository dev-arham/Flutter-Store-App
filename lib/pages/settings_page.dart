import 'package:flutter/material.dart';
import 'package:store_app/components/list_tile_item.dart';
import 'package:store_app/pages/password_manager_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text(
          "Settings",
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
              ListTileItem(
                title: "Notification Settings",
                tileIcon: const Icon(Icons.notifications_outlined),
                onTap: () {},
              ),
              ListTileItem(
                title: "Password Manager",
                tileIcon: const Icon(Icons.key_outlined),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PasswordManagerPage()));
                },
              ),
              ListTileItem(
                title: "Delete Account",
                tileIcon: const Icon(Icons.remove_circle_outline),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
