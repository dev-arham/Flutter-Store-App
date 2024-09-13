import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/large_button.dart';
import 'package:store_app/models/shop.dart';
import 'package:store_app/pages/checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItemFromCart(context, item) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Remove Item"),
              content: const Text(
                  "Are you sure, want to remove this item from your cart?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(item);
                  },
                  child: const Text("Yes"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text(
          "My Cart",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: "main_font",
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: cart.isEmpty
          ? const SizedBox()
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            hintText: "Promo Code",
                            hintStyle: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                                fontFamily: "main_font",
                                letterSpacing: 1),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade500, width: 1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red.shade800, width: 1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.red[800],
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12)),
                        onPressed: () {},
                        child: Text(
                          "Apply",
                          style: TextStyle(
                              color: Colors.grey[50],
                              fontSize: 16,
                              fontFamily: "main_font",
                              letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sub-Total",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "main_font",
                              letterSpacing: 1),
                        ),
                        Text(
                          "${context.read<Shop>().getSubTotalPrice()}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "main_font",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Fee",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "main_font",
                              letterSpacing: 1),
                        ),
                        Text(
                          "PKR 250",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "main_font",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "main_font",
                              letterSpacing: 1),
                        ),
                        Text(
                          "- PKR 0",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "main_font",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Cost",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "main_font",
                              letterSpacing: 1),
                        ),
                        Text(
                          "${context.read<Shop>().getTotalPrice()}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "main_font",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  LargeButton(
                      buttonText: "Proceed To Checkout",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CheckoutPage()));
                      })
                ],
              ),
            ),
      body: cart.isEmpty
          ? const Center(
              child: Text("Are you broke? Go and add items to your cart!"))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                int quantity = item.quantity;
                return Slidable(
                  endActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) => removeItemFromCart(context, item),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete_outline,
                    )
                  ]),
                  child: ListTile(
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
                    trailing: SizedBox(
                      width: 85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (item.quantity == 1) {
                              } else {
                                setState(() {
                                  context.read<Shop>().quantityDecreament(item);
                                });
                              }
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$quantity",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: "main_font",
                                letterSpacing: 1),
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              context.read<Shop>().quantityIncreament(item);
                            }),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.red[900],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                        // IconButton(
                        //   onPressed: () => removeItemFromCart(context, item),
                        //   icon: const Icon(Icons.delete_outlined),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
