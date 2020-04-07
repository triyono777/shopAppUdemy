import 'package:flutter/material.dart';
import 'package:phicos_mart/providers/cart.dart';
import 'package:phicos_mart/screens/cart_screen.dart';
import 'package:phicos_mart/screens/product_detail_screen.dart';
import 'package:phicos_mart/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';
import './providers/products_list_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsListProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],

//      create: (ctx) => ProductsListProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
