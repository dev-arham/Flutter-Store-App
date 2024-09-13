import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/large_button.dart';
import 'package:store_app/models/shop.dart';
import 'package:store_app/pages/main_page.dart';
import 'package:store_app/pages/my_orders_page.dart';

class PaymentSuccessfulPage extends StatefulWidget {
  const PaymentSuccessfulPage({super.key});

  @override
  State<PaymentSuccessfulPage> createState() => _PaymentSuccessfulPageState();
}

class _PaymentSuccessfulPageState extends State<PaymentSuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text(
          "Payment Methods",
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
        child: Column(
          children: [
            LargeButton(
                buttonText: "View Order",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyOrdersPage()));
                  setState(() {
                    context.read<Shop>().confirmOrder(cart);
                  });
                }),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const MainPage()));
                  setState(() {
                    context.read<Shop>().confirmOrder(cart);
                  });
                },
                child: Text(
                  "Return Home",
                  style: TextStyle(
                      color: Colors.red[800],
                      fontSize: 18,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                ))
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Payment Successful",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: "main_font",
                  letterSpacing: 1),
            ),
            Text(
              "Thank you for your purchase",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontFamily: "main_font",
                  letterSpacing: 1),
            ),
          ],
        ),
      ),
    );
  }
}
