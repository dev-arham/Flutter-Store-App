import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/large_button.dart';
import 'package:store_app/models/shop.dart';
import 'package:store_app/pages/checkout_payment_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text(
          "Checkout",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: "main_font",
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(
              0,
              0,
            ),
            blurRadius: 15.0,
            spreadRadius: 0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ]),
        child: LargeButton(
            buttonText: "Continue to Payment",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CheckoutPaymentPage()));
            }),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Shipping Address",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text(
              "Home",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "main_font",
                  letterSpacing: 1),
            ),
            subtitle: const Text(
              "8, B-2, 2nd Street Karachi",
              style: TextStyle(
                  fontSize: 16, fontFamily: "main_font", letterSpacing: 1),
            ),
            trailing: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  side: BorderSide(color: Colors.grey.shade300)),
              child: const Text("CHANGE"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1,
              color: Colors.grey[300],
              height: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Choose Shipping Type",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text(
              "Economy",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "main_font",
                  letterSpacing: 1),
            ),
            subtitle: const Text(
              "Estimate delivery time 5 to 7 days",
              style: TextStyle(
                  fontSize: 16, fontFamily: "main_font", letterSpacing: 1),
            ),
            trailing: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  side: BorderSide(color: Colors.grey.shade300)),
              child: const Text("CHANGE"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1,
              color: Colors.grey[300],
              height: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Row(
              children: [
                Text(
                  "Order List",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
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
                        fontSize: 16,
                        fontFamily: "main_font",
                        letterSpacing: 1),
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
            ),
          )
        ],
      ),
    );
  }
}
