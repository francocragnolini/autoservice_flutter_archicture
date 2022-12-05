import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  // mapa de items
  // each card item will be added in a map instead of a List or Array
  //Map<String, CartItem> _items;
  Map<String, CartItem> _items = {};

  // getter - copy of _items
  //show the cartItems in the list
  Map<String, CartItem> get items {
    return {..._items};
  }

  // getter to know the quantity of products in the cart.
  int get itemCount {
    return _items.length;
  }

  // getter Sum total
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // USE THIS METHOD TO MAKE AN HTTP REQUESTO TO MOCKAPI
  //method: add an item to the cart
  void addItem(String productId, double price, String title) {
    // if product exists updates the quantity
    if (_items.containsKey(productId)) {
      //... change quantity
      _items.update(
          productId,
          (existingCardItem) => CartItem(
              id: existingCardItem.id,
              title: existingCardItem.title,
              price: existingCardItem.price,
              quantity: existingCardItem.quantity + 1));
    } else {
      // if item doesn´t exist in the cart added
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                quantity: 1,
                price: price,
              ));
    }
    notifyListeners();
  }

  //removes the item from the cart list
  void removeItem(String productId) {
    // Easiest way to remove an element from a Map
    _items.remove(productId);
    notifyListeners();
  }

  // clear all items in the cart-list
  void clear() {
    _items = {};
    notifyListeners();
  }

  // WATCH THE DIFFERENCE BETWEEN THE OTHER REMOVE-ITEM METHOD
  // remove Cartitem
  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    // because I'm checking if there's not a product
    // so I asure
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity - 1,
              ));
    }
    notifyListeners();
  }
}
