import 'package:flutter/material.dart';
import 'package:phicos_mart/widgets/Products_grid.dart';
import 'package:provider/provider.dart';
import '../providers/products_list_provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final producsContainer =
        Provider.of<ProductsListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorites) {
                producsContainer.showFavoritesOnly();
              } else {
                producsContainer.showAll();
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
