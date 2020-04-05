import 'package:flutter/material.dart';
import 'package:phicos_mart/providers/product.dart';
import 'package:phicos_mart/widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_list_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showfavs;

  const ProductsGrid({Key key, this.showfavs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsListProvider>(context);
    final products = showfavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
//        create: (ct) => products[index],
        value: products[index],
        child: ProductItem(
//          title: products[index].title,
//          imageUrl: products[index].imageUrl,
//          id: products[index].id,
            ),
      ),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
    );
  }
}
