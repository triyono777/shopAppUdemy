import 'package:flutter/material.dart';
import 'package:phicos_mart/providers/orders.dart' show Orders;
import 'package:phicos_mart/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;
  @override
  void initState() {
//    _isLoading = true;
//    Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then((_) {
//      setState(() {
//        _isLoading = false;
//      });
//    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build orders');
//    final orderData = Provider.of<Orders>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future:
              Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                // do
                return Center(
                  child: Text('An error accured'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (ctx, i) => OrderItem(
                      order: orderData.orders[i],
                    ),
                  ),
                );
              }
            }
          },
        ));
  }
}
