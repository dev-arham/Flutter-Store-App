import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/shop.dart';
import 'package:store_app/components/item_card.dart';
import 'package:store_app/pages/product_details_page.dart';

class JacketsPage extends StatefulWidget {
  const JacketsPage({super.key});

  @override
  State<JacketsPage> createState() => _JacketsPageState();
}

class _JacketsPageState extends State<JacketsPage> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final myProducts = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          leading: const SizedBox(),
          title: const Text(
            "Jackets",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontFamily: "main_font",
                letterSpacing: 1),
          ),
          centerTitle: true,
        ),
        body: myProducts.isEmpty
            ? const Center(
                child: Text("Sorry, We don't have any items yet!"),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                              fontFamily: "main_font",
                              letterSpacing: 1),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
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
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _buildPants()),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ));
  }

  _buildPants() => GridView.builder(
        shrinkWrap: true,
        itemCount: Shop.jackets.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.54,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => ItemCard(
          product: Shop.jackets[index],
          onPress: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                    product: Shop.jackets[index],
                  ))),
        ),
      );
}
