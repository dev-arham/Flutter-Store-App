import 'package:flutter/material.dart';
import 'package:store_app/components/large_button.dart';
import 'package:store_app/pages/payment_successful_page.dart';

class CheckoutPaymentPage extends StatefulWidget {
  const CheckoutPaymentPage({super.key});

  @override
  State<CheckoutPaymentPage> createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutPaymentPage> {
  late int? selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }

  setSelectedRadio(int? val) {
    setState(() {
      selectedRadio = val;
    });
  }

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
            buttonText: "Confirm Payment",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PaymentSuccessfulPage()));
            }),
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
                  trailing: Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      activeColor: Colors.red.shade800,
                      onChanged: (val) {
                        setSelectedRadio(val);
                      }),
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
                      trailing: Radio(
                          value: 2,
                          groupValue: selectedRadio,
                          activeColor: Colors.red.shade800,
                          onChanged: (val) {
                            setSelectedRadio(val);
                          }),
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
                      trailing: Radio(
                          value: 3,
                          groupValue: selectedRadio,
                          activeColor: Colors.red.shade800,
                          onChanged: (val) {
                            setSelectedRadio(val);
                          }),
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      height: 0,
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/images/google-logo-100.png",
                        width: 20,
                      ),
                      title: Text(
                        "Google Pay",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[500],
                            fontFamily: "main_font",
                            letterSpacing: 1),
                      ),
                      trailing: Radio(
                          value: 4,
                          groupValue: selectedRadio,
                          activeColor: Colors.red.shade800,
                          onChanged: (val) {
                            setSelectedRadio(val);
                          }),
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
