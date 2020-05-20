import 'package:flutter/material.dart';
import 'package:phicos_mart/helpers/custom_route.dart';
import 'package:phicos_mart/providers/my_auth.dart';
import 'package:phicos_mart/screens/orders_screen.dart';
import 'package:phicos_mart/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('hello friends'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
//              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
              Navigator.pushReplacement(
                  context, CustomRoute(builder: (ctx) => OrderScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
//              Navigator.of(context)
//                  .pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<MyAuth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
