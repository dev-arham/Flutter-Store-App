import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';

class Shop extends ChangeNotifier {
  static final List<Product> _shop = [
    ...shirts,
    ...pants,
    ...jackets,
    ...shorts,
  ];

  static final List<Product> shirts = [
    Product(
      id: 1,
      title: "Printed Shirt",
      rating: "4.4",
      price: 599,
      image: "assets/images/shirt1.png",
      description:
          "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
      categories: ["all", "men", "newest", "shirt", "popular"],
      quantity: 1,
      style: "Male's Style",
    ),
    Product(
        id: 2,
        title: "Printed Shirt",
        rating: "4.3",
        price: 349,
        image: "assets/images/shirt2.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "shirt"],
        quantity: 1,
        style: "Male's Style"),
    Product(
        id: 3,
        title: "Printed Shirt",
        rating: "4.9",
        price: 949,
        image: "assets/images/shirt3.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "newest", "shirt"],
        quantity: 1,
        style: "Male's Style"),
  ];

  static final List<Product> pants = [
    Product(
        id: 4,
        title: "Pant",
        rating: "4.0",
        price: 799,
        image: "assets/images/pant1.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "newest", "pant", "popular"],
        quantity: 1,
        style: "Male's Style"),
    Product(
        id: 5,
        title: "Jeans",
        rating: "4.0",
        price: 799,
        image: "assets/images/pant2.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "pant"],
        quantity: 1,
        style: "Male's Style"),
    Product(
        id: 6,
        title: "Black Jeans",
        rating: "4.0",
        price: 799,
        image: "assets/images/pant3.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "newest", "pant"],
        quantity: 1,
        style: "Male's Style"),
  ];

  static final List<Product> jackets = [
    Product(
        id: 7,
        title: "Jacket 1",
        rating: "4.0",
        price: 799,
        image: "assets/images/jacket1.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "newest", "jacket", "popular"],
        quantity: 1,
        style: "Male's Style"),
    Product(
        id: 8,
        title: "Jacket 2",
        rating: "4.0",
        price: 799,
        image: "assets/images/jacket2.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "jacket"],
        quantity: 1,
        style: "Male's Style"),
    Product(
        id: 9,
        title: "Jacket 3",
        rating: "4.0",
        price: 799,
        image: "assets/images/jacket3.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "newest", "jacket"],
        quantity: 1,
        style: "Male's Style"),
  ];

  static final List<Product> shorts = [
    Product(
        id: 7,
        title: "Shorts 1",
        rating: "4.5",
        price: 799,
        image: "assets/images/shorts1.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "newest", "shorts", "popular"],
        quantity: 1,
        style: "Male's Style"),
    Product(
        id: 8,
        title: "Shorts 2",
        rating: "4.2",
        price: 559,
        image: "assets/images/shorts2.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "shorts"],
        quantity: 1,
        style: "Male's Style"),
    Product(
        id: 9,
        title: "Shorts 3",
        rating: "4.3",
        price: 649,
        image: "assets/images/shorts3.png",
        description:
            "Morbi iaculis velit quis quam vehicula, sit amet vehicula velit tempus. Integer metus sem, scelerisque cursus cursus vel, malesuada sit amet ante. Pellentesque gravida purus orci, ",
        categories: ["all", "men", "newest", "jacket"],
        quantity: 1,
        style: "Male's Style"),
  ];

  List<Product> get shop => _shop;

  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  final List<Product> _wishlist = [];

  List<Product> get wishlist => _wishlist;

  final List<Product> _orders = [];

  List<Product> get orders => _orders;

  void addToWishlist(Product item) {
    _wishlist.add(item);
    notifyListeners();
  }

  void removeFromWishlist(Product item) {
    _wishlist.remove(item);
    notifyListeners();
  }

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  void quantityIncreament(Product item) {
    item.quantity++;
    notifyListeners();
  }

  void quantityDecreament(Product item) {
    item.quantity--;
    notifyListeners();
  }

  getSubTotalPrice() {
    double subTotal = 0.0;
    for (Product item in cart) {
      subTotal += item.price * item.quantity;
    }
    return subTotal;
  }

  getTotalPrice() {
    double total = 0.0;
    double subTotal = getSubTotalPrice();
    total = subTotal + 250.0;
    return total;
  }

  confirmOrder(List<Product> item) {
    for (var element in item) {
      orders.add(element);
    }
    cart.clear();
  }
}
