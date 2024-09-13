class Product {
  final String title, image, rating, style, description;
  final int id, price;
  int quantity;
  final List categories;
  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.price,
    required this.style,
    required this.description,
    required this.categories,
    required this.quantity,
  });
}
