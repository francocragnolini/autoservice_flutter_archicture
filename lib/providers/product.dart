class Product {
  final String id;
  final String ean;
  final String title;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.ean,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
  });
}
