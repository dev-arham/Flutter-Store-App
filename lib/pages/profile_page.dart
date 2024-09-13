import 'package:flutter/material.dart';
import 'package:store_app/components/list_tile_item.dart';
import 'package:store_app/pages/help_center_page.dart';
import 'package:store_app/pages/my_orders_page.dart';
import 'package:store_app/pages/payment_methods_page.dart';
import 'package:store_app/pages/settings_page.dart';
import 'package:store_app/pages/signin_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          leading: const SizedBox(),
          title: const Text(
            "My Profile",
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
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/profile-picture.jpeg")),
                          shape: BoxShape.circle),
                    ),
                    Container(
                      alignment: const Alignment(-1, 1),
                      height: 120,
                      width: 120,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.red[800],
                            side: BorderSide(
                                color: Colors.grey.shade100, width: 2)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Arham Mustafa",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTileItem(
                  title: "Your Profile",
                  tileIcon: const Icon(Icons.person_2_outlined),
                  onTap: () {},
                ),
                ListTileItem(
                  title: "Payment Methods",
                  tileIcon: const Icon(Icons.credit_card),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PaymentMethodsPage()));
                  },
                ),
                ListTileItem(
                  title: "My Orders",
                  tileIcon: const Icon(Icons.list_alt),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyOrdersPage()));
                  },
                ),
                ListTileItem(
                  title: "Settings",
                  tileIcon: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
                  },
                ),
                ListTileItem(
                  title: "Help Center",
                  tileIcon: const Icon(Icons.info_outline),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HelpCenterPage()));
                  },
                ),
                ListTileItem(
                  title: "Privacy Policy",
                  tileIcon: const Icon(Icons.lock_outline),
                  onTap: () {},
                ),
                ListTileItem(
                  title: "Invite Friends",
                  tileIcon: const Icon(Icons.person_add),
                  onTap: () {},
                ),
                ListTileItem(
                  title: "Log Out",
                  tileIcon: const Icon(Icons.logout_outlined),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SigninPage()));
                  },
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ));
  }
}
