import 'package:flutter/material.dart';
import 'package:phicos_mart/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products_list_provider.dart';

class UserProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              //..
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (_, index) => UserProductItem(
            title: productsData.items[index].title,
            imageUrl: productsData.items[index].imageUrl,
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
