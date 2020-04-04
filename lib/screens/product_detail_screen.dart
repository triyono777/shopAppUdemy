import 'package:flutter/material.dart';
import 'package:phicos_mart/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
//  final String title;
//  final double price;
//
//  const ProductDetailScreen({Key key, @required this.title, this.price})
//      : super(key: key);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // this is the id
    final loadedProduct =
        Provider.of<ProductsListProvider>(context).items.firstWhere(
              (prod) => prod.id == productId,
            );
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
