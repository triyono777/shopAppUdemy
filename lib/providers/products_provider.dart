import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [...items];
  }

  void addProduct() {
//    _items.add(value);
    notifyListeners();
  }
}
