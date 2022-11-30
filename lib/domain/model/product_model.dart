class Product {
  final String ean;
  final String plu;
  final String title;
  final double price;
  final String imageUrl;
  final String description;

  Product(
      {required this.ean,
      required this.imageUrl,
      required this.plu,
      required this.title,
      required this.price,
      required this.description});
}
