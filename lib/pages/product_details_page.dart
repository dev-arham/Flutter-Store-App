import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/shop.dart';
import 'package:store_app/pages/cart_page.dart';
import '../models/product.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int isSelected = 0;
  int selectedColor = 0;

  List<Color> productColors = [
    Colors.black,
    Colors.yellow,
    Colors.blue,
    Colors.green,
  ];

  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Add To Cart"),
              content: const Text("Add this item to your cart?"),
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
                    context.read<Shop>().addToCart(widget.product);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                  child: const Text("Yes"),
                ),
              ],
            ));
  }

  late bool wishlistedProduct;

  @override
  Widget build(BuildContext context) {
    if (context.read<Shop>().wishlist.contains(widget.product)) {
      wishlistedProduct = true;
    } else {
      wishlistedProduct = false;
    }
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.red[500],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 16,
                        fontFamily: "main_font",
                        letterSpacing: 1),
                  ),
                  Text(
                    "PKR ${widget.product.price}",
                    style: TextStyle(
                        color: Colors.grey[50],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "main_font",
                        letterSpacing: 1),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => addToCart(context),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15)),
                child: const Row(
                  children: [
                    Text(
                      "Add To Cart",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_bag_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.product.image),
                            fit: BoxFit.cover),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.white),
                        ),
                        Text(
                          "Product Details",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "main_font",
                              letterSpacing: 1),
                        ),
                        IconButton(
                          onPressed: () {
                            if (context
                                .read<Shop>()
                                .wishlist
                                .contains(widget.product)) {
                              context
                                  .read<Shop>()
                                  .removeFromWishlist(widget.product);
                              setState(() {
                                wishlistedProduct = false;
                              });
                            } else {
                              context
                                  .read<Shop>()
                                  .addToWishlist(widget.product);
                              setState(() {
                                wishlistedProduct = true;
                              });
                            }
                          },
                          icon: wishlistedProduct
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                ),
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.product.style,
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 16,
                              fontFamily: "main_font",
                              letterSpacing: 1),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.product.rating,
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 16,
                              fontFamily: "main_font",
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.product.title,
                      style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Product Description",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.product.description,
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 16,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                    const Divider(
                      height: 40,
                      thickness: 1,
                    ),
                    Text(
                      "Select Size",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildSizePicker(index: 0, name: "S"),
                          _buildSizePicker(index: 1, name: "M"),
                          _buildSizePicker(index: 2, name: "L"),
                          _buildSizePicker(index: 3, name: "X L"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Select Color",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                    // const Row(
                    //   children: [
                    //     ColorDot(
                    //       color: Colors.black,
                    //       isSelected: true,
                    //     ),
                    //     ColorDot(
                    //       color: Colors.red,
                    //     ),
                    //     ColorDot(
                    //       color: Colors.yellow,
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return _buildColorDots(
                                color: productColors[index],
                                isSelected: selectedColor == index,
                                index: index);
                          }),
                    ),
                    const SizedBox(
                      height: 20,
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

  _buildSizePicker({required int index, required String name}) =>
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

  _buildColorDots({required color, isSelected, index}) => GestureDetector(
        onTap: () => setState(() {
          selectedColor = index;
        }),
        child: Container(
          height: 25,
          width: 25,
          padding:
              isSelected ? const EdgeInsets.all(3) : const EdgeInsets.all(0),
          margin: const EdgeInsets.only(right: 10, top: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.red.shade800 : color,
            ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
}
