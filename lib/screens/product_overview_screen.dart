import 'package:flutter/material.dart';
import 'package:phicos_mart/providers/cart.dart';
import 'package:phicos_mart/screens/cart_screen.dart';
import 'package:phicos_mart/widgets/Products_grid.dart';
import 'package:phicos_mart/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/products_list_provider.dart';
import '../widgets/badge.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // with listen:false

//    Provider.of<ProductsListProvider>(context, listen: false)
//        .fetchAndSetProducts();

    // with delayed.zero

//    Future.delayed(Duration.zero).then((_) {
//      Provider.of<ProductsListProvider>(context).fetchAndSetProducts();
//    });
    super.initState();
  }

  // with didChangeDependencies
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<ProductsListProvider>(context)
          .fetchAndSetProducts()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text(' Show Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All Product'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (ctx, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(
              showfavs: _showOnlyFavorites,
            ),
    );
  }
}
