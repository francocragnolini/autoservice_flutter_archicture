// class Product {
//   final String ean;
//   final String plu;
//   final String title;
//   final double price;
//   final String imageUrl;
//   final String description;

//   Product(
//       {required this.ean,
//       required this.imageUrl,
//       required this.plu,
//       required this.title,
//       required this.price,
//       required this.description});
// }

// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

// FROM QUICKTYPE JSON PARSER
import 'dart:convert';

class Product {
  Product({
    required this.ean,
    required this.plu,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  final String ean;
  final String plu;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product copyWith({
    String? ean,
    String? plu,
    String? title,
    String? description,
    double? price,
    String? imageUrl,
  }) =>
      Product(
        ean: ean ?? this.ean,
        plu: plu ?? this.plu,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  // takes the json String after that decode the json into a dart map
  // then convert the dart Map into a Product model
  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  // takes the dart Map and conver the data into a Json String
  String toJson() => json.encode(toMap());

  // here I could add more validations in case the data failed
  // look at Andrea's Parsing Json Article
  factory Product.fromMap(Map<String, dynamic> json) => Product(
        ean: json["ean"],
        plu: json["plu"],
        title: json["title"],
        description: json["description"],
        price: json["price"].toDouble(),
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "ean": ean,
        "plu": plu,
        "title": title,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
      };
}
