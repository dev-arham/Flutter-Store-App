import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/item_card.dart';
import 'package:store_app/models/shop.dart';
import 'package:store_app/pages/cart_page.dart';
import 'package:store_app/pages/category_page.dart';
import './product_details_page.dart';
import '../components/carousel_slide.dart';
import '../components/category_avatar.dart';
import '../models/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 0;
  String myLocation = "Karachi";
  List<String> cities = [
    "Karachi",
    "Islamabad",
    "Hyderabad",
    "Lahore",
    "Multan",
  ];

  @override
  Widget build(BuildContext context) {
    final myProducts = context.watch<Shop>().shop;
    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red[800],
                        ),
                        DropdownButton<String>(
                          items: cities.map((String dropdownMenuItem) {
                            return DropdownMenuItem<String>(
                              value: dropdownMenuItem,
                              child: Text(dropdownMenuItem,
                                  style: TextStyle(
                                      color: Colors.red[800],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "main_font",
                                      letterSpacing: 1)),
                            );
                          }).toList(),
                          onChanged: (String? newValueSelected) {
                            setState(() {
                              myLocation = newValueSelected!;
                            });
                          },
                          value: myLocation,
                          dropdownColor: Colors.grey[50],
                          underline: Container(
                            height: 0,
                            color: Colors.grey[50],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ],
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartPage()));
                  },
                  icon: const Icon(Icons.shopping_cart),
                  iconSize: 25,
                  style:
                      IconButton.styleFrom(backgroundColor: Colors.grey[200]),
                )
              ],
            ),
          ),
          const CarouselSliderWidget(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryPage()));
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(
                        color: Colors.red[800],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "main_font",
                        letterSpacing: 1),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Category.categoryItems.length,
              itemExtent: 95,
              itemBuilder: (BuildContext context, int index) {
                return CategoryAvatar(
                  imagePath: Category.categoryItems[index]["image"],
                  text: Category.categoryItems[index]["title"],
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            Category.categoryItems[index]["screen"]),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Flash Sale",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
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
            height: 90,
          )
        ],
      ),
    );
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

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int currentIndex = 0;

  List<Widget> slides = const [
    CarouselSlide(
      bannerImagePath: "assets/images/banner-img1.png",
      bannerTitle: "New Arrivals",
      bannerDescription: "Discount 50% for the first transaction",
      bannerButtonText: "Shop Now",
    ),
    CarouselSlide(
      bannerImagePath: "assets/images/banner-img2.png",
      bannerTitle: "Best Sellers",
      bannerDescription: "Discount 50% for the first transaction",
      bannerButtonText: "Shop Now",
    ),
    CarouselSlide(
      bannerImagePath: "assets/images/banner-img3.png",
      bannerTitle: "Winter Sale",
      bannerDescription: "Discount 50% for the first transaction",
      bannerButtonText: "Shop Now",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 190,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: slides,
          ),
        ),
        DotsIndicator(
          dotsCount: slides.length,
          position: currentIndex,
          decorator: DotsDecorator(
              color: Colors.grey.shade300,
              activeColor: Colors.red[800],
              size: const Size(10, 10),
              activeSize: const Size(10, 10)),
        ),
      ],
    );
  }
}
