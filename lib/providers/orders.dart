import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:phicos_mart/providers/cart.dart';
import 'dart:convert';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    // ignore: sdk_version_ui_as_code
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    const url = 'https://scannen-apps.firebaseio.com/phicosmart/orders.json';
    final response = await http.get(url);
    print(json.decode(response.body));
  }

  Future<void> addOrders(List<CartItem> cartProducts, double total) async {
    const url = 'https://scannen-apps.firebaseio.com/phicosmart/orders.json';
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'datetime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
      }),
    );
    _orders.insert(
      0,
      OrderItem(
          id: json.decode(response.body)['nama'],
          amount: total,
          products: cartProducts,
          dateTime: DateTime.now()),
    );
    notifyListeners();
  }
}
