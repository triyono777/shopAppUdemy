import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
//  final String title;
//  final double price;
//
//  const ProductDetailScreen({Key key, @required this.title, this.price})
//      : super(key: key);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
