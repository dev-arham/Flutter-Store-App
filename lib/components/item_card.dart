import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';
import 'package:store_app/models/product.dart';

class ItemCard extends StatefulWidget {
  final Product product;
  final void Function()? onPress;
  const ItemCard({super.key, required this.product, required this.onPress});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  late bool wishlistedProduct;

  @override
  Widget build(BuildContext context) {
    if (context.read<Shop>().wishlist.contains(widget.product)) {
      wishlistedProduct = true;
    } else {
      wishlistedProduct = false;
    }
    return GestureDetector(
      onTap: widget.onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(widget.product.image),
              ),
              IconButton(
                  onPressed: () {
                    if (context
                        .read<Shop>()
                        .wishlist
                        .contains(widget.product)) {
                      context.read<Shop>().removeFromWishlist(widget.product);
                      setState(() {
                        wishlistedProduct = false;
                      });
                    } else {
                      context.read<Shop>().addToWishlist(widget.product);
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
                      : const Icon(Icons.favorite_outline))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                widget.product.title,
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "main_font",
                    letterSpacing: 1),
              ),
              const Spacer(),
              const Icon(
                Icons.star,
                color: Colors.deepOrange,
                size: 20,
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
            "PKR ${widget.product.price}",
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: "main_font",
                letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
