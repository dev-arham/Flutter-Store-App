import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/shop.dart';
import 'package:store_app/components/item_card.dart';
import 'package:store_app/pages/product_details_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final myProducts = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          leading: const SizedBox(),
          title: const Text(
            "All Products",
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
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildProductCategory(index: 0, name: "All"),
                            _buildProductCategory(index: 1, name: "Shirt"),
                            _buildProductCategory(index: 2, name: "Pant"),
                            _buildProductCategory(index: 3, name: "Jacket"),
                            _buildProductCategory(index: 4, name: "Shorts"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: isSelected == 0
                          ? _buildAllProducts(products: myProducts)
                          : isSelected == 1
                              ? _buildShirts()
                              : isSelected == 2
                                  ? _buildPants()
                                  : isSelected == 3
                                      ? _buildJackets()
                                      : isSelected == 4
                                          ? _buildShorts()
                                          : null,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ));
  }

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() {
          isSelected = index;
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected == index
                  ? Colors.red.shade800
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.red.shade800)),
          child: Text(
            name,
            style: isSelected == index
                ? const TextStyle(color: Colors.white)
                : TextStyle(color: Colors.red.shade800),
          ),
        ),
      );

  _buildAllProducts({required products}) => GridView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.54,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) => ItemCard(
            product: products[index],
            onPress: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetailsPage(
                      product: products[index],
                    ))),
          ));

  _buildShirts() => GridView.builder(
        shrinkWrap: true,
        itemCount: Shop.shirts.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.54,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => ItemCard(
          product: Shop.shirts[index],
          onPress: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                    product: Shop.shirts[index],
                  ))),
        ),
      );

  _buildPants() => GridView.builder(
        shrinkWrap: true,
        itemCount: Shop.pants.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.54,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => ItemCard(
          product: Shop.pants[index],
          onPress: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                    product: Shop.pants[index],
                  ))),
        ),
      );

  _buildJackets() => GridView.builder(
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

  _buildShorts() => GridView.builder(
        shrinkWrap: true,
        itemCount: Shop.shorts.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.54,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => ItemCard(
          product: Shop.shorts[index],
          onPress: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                    product: Shop.shorts[index],
                  ))),
        ),
      );
}
