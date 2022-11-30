import "dart:convert";
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:autoservice_app/providers/product.dart';

class Products with ChangeNotifier {
  // 1
  // List<Product> _items = [];
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // getter
  List<Product> get items {
    return [..._items];
  }

  // ASYNC AND AWAIT
  Future<void> addProduct(Product product) async {
    final url = Uri.https(
        "https://shop-app-flutter-33353-default-rtdb.firebaseio.com/products.json");

    // handling errors with try-catch
    try {
      // future: post producto: agrega un nuevo producto a la base de datos
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
          }));

      // renderizado del producto
      final newProduct = Product(
          // json decode: transforma el Json a un objeto en dart(Map)
          id: json.decode(response.body)["name"],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);

      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  // fetch all products
  Future<void> fetchAndSetProducts() async {
    final url = Uri.https(
        "shop-app-flutter-33353-default-rtdb.firebaseio.com", "/products.json");
    try {
      final response = await http.get(url);
      // we tell dart that the data is a map with a string key, and value dynamic
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach(
        (prodId, prodData) => loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          imageUrl: prodData['imageUrl'],
        )),
      );
      _items = loadedProducts;
      print(json.decode(response.body));
    } catch (error) {
      throw (error);
    }
  }

  //3-  find a product by id (applied:product_detail_screen)
  Product findById(String id) {
    return _items.firstWhere((producto) => producto.id == id);
  }

  // UPDATES THE PRODUCT IN THE DB
  // update a product
  void updateProduct(String id, Product newProduct) async {
    // indice en la lista o arreglo
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.https(
          "shop-app-flutter-33353-default-rtdb.firebaseio.com",
          "/products/$id.json");
      http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print("...");
    }
  }

  // delete product
  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}










// List<Product> _items = [
//     Product(
//       id: 'p1',
//       title: 'Red Shirt',
//       description: 'A red shirt - it is pretty red!',
//       price: 29.99,
//       imageUrl:
//           'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//     ),
//     Product(
//       id: 'p2',
//       title: 'Trousers',
//       description: 'A nice pair of trousers.',
//       price: 59.99,
//       imageUrl:
//           'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
//     ),
//     Product(
//       id: 'p3',
//       title: 'Yellow Scarf',
//       description: 'Warm and cozy - exactly what you need for the winter.',
//       price: 19.99,
//       imageUrl:
//           'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
//     ),
//     Product(
//       id: 'p4',
//       title: 'A Pan',
//       description: 'Prepare any meal you want.',
//       price: 49.99,
//       imageUrl:
//           'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
//     ),
//   ];


  // UPDATES THE PRODUCT ONLY IN MEMORY
  // update a product
  // void updateProduct(String id, Product newProduct) {
  //   // indice en la lista o arreglo
  //   final prodIndex = _items.indexWhere((prod) => prod.id == id);
  //   if (prodIndex >= 0) {
  //     _items[prodIndex] = newProduct;
  //     notifyListeners();
  //   } else {
  //     print("...");
  //   }
  // }