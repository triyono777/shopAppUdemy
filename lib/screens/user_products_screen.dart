import 'package:flutter/material.dart';
import 'package:phicos_mart/screens/edit_product_screen.dart';
import 'package:phicos_mart/widgets/app_drawer.dart';
import 'package:phicos_mart/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products_list_provider.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductsListProvider>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsListProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (_, index) => Column(
              children: <Widget>[
                UserProductItem(
                  id: productsData.items[index].id,
                  title: productsData.items[index].title,
                  imageUrl: productsData.items[index].imageUrl,
                ),
                Divider(),
              ],
            ),
            itemCount: productsData.items.length,
          ),
        ),
      ),
    );
  }
}
