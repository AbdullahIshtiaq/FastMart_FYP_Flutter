import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/screens/orders/components/order_screen_products.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(
            "Orders",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Expanded(
                child: OrdersScreenProducts(
              userId: userId,
            )),
          ),
        ),
      ),
    );
  }
}
