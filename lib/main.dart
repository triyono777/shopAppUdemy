import 'package:flutter/material.dart';
import 'package:phicos_mart/providers/my_auth.dart';
import 'package:phicos_mart/providers/cart.dart';
import 'package:phicos_mart/providers/orders.dart';
import 'package:phicos_mart/screens/cart_screen.dart';
import 'package:phicos_mart/screens/edit_product_screen.dart';
import 'package:phicos_mart/screens/orders_screen.dart';
import 'package:phicos_mart/screens/product_detail_screen.dart';
import 'package:phicos_mart/screens/product_overview_screen.dart';
import 'package:phicos_mart/screens/splash_screen.dart';
import 'package:phicos_mart/widgets/user_product_item.dart';
import 'package:provider/provider.dart';
import './providers/products_list_provider.dart';
import './screens/user_products_screen.dart';
import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MyAuth(),
        ),
        ChangeNotifierProxyProvider<MyAuth, ProductsListProvider>(
          builder: (ctx, auth, previousProduct) => ProductsListProvider(
              auth.token,
              auth.userId,
              previousProduct == null ? [] : previousProduct.items),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<MyAuth, Orders>(
          builder: (ctx, auth, previousOrders) => Orders(auth.token,
              auth.userId, previousOrders == null ? [] : previousOrders.orders),
        ),
      ],

//      create: (ctx) => ProductsListProvider(),
      child: Consumer<MyAuth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? ProductOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrderScreen.routeName: (ctx) => OrderScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
