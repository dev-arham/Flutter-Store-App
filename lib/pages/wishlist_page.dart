import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/shop.dart';
import 'package:store_app/components/item_card.dart';
import 'package:store_app/pages/product_details_page.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    final myProducts = context.watch<Shop>().wishlist;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          leading: const SizedBox(),
          title: const Text(
            "My Wishlist",
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
                child: Text("You don't have any wishlisted item!"),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: myProducts.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.54,
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) => ItemCard(
                              product: myProducts[index],
                              onPress: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductDetailsPage(
                                            product: myProducts[index],
                                          ))),
                            )),
                  ),
                ],
              ));
  }
}
