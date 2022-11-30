import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // para mantener la inmutabilidad.
  // crea una copia de la instacia producto donde puedo mainpular cada propiedad
  // ya qie es un objeto inmutable, cada porpiedad es final.
  Product copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
