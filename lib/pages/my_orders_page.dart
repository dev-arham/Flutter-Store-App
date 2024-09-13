import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/shop.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<Shop>().orders;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: const Text(
            "My Orders",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontFamily: "main_font",
                letterSpacing: 1),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final item = orders[index];
            int quantity = item.quantity;
            return ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item.image,
                  )),
              title: Text(
                item.title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "main_font",
                    letterSpacing: 1),
              ),
              subtitle: Text(
                "PKR ${item.price}",
                style: const TextStyle(
                    fontSize: 16, fontFamily: "main_font", letterSpacing: 1),
              ),
              trailing: Text(
                "$quantity",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "main_font",
                    letterSpacing: 1),
              ),
            );
          },
        ));
  }
}
