import 'package:flutter/material.dart';

import 'cart.dart';

// provider CartItem class

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    // insert: 0(index) inserta al inicio de la lista
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            //the amount is the total i'm getting as an argument
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
