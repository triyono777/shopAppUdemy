import 'package:flutter/material.dart';
import 'package:phicos_mart/providers/products_list_provider.dart';
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
        Provider.of<ProductsListProvider>(context, listen: false)
            .findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
