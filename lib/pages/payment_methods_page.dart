import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Credit & Debit Card",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "main_font",
                        letterSpacing: 1),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(
                        0,
                        0,
                      ),
                      blurRadius: 15.0,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.credit_card),
                  title: Text(
                    "Add New Card",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500],
                        fontFamily: "main_font",
                        letterSpacing: 1),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Link",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red[800],
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Text(
                    "More Payment Methods",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "main_font",
                        letterSpacing: 1),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(
                        0,
                        0,
                      ),
                      blurRadius: 15.0,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.paypal_outlined,
                        color: Colors.red[800],
                      ),
                      title: Text(
                        "Paypal",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[500],
                            fontFamily: "main_font",
                            letterSpacing: 1),
                      ),
                      trailing: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Link",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red[800],
                              fontFamily: "main_font",
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      height: 0,
                    ),
                    ListTile(
                      leading: const Icon(Icons.apple_outlined),
                      title: Text(
                        "Apple Pay",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[500],
                            fontFamily: "main_font",
                            letterSpacing: 1),
                      ),
                      trailing: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Link",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red[800],
                              fontFamily: "main_font",
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
