import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/Cart.dart';
import 'package:fyp_frontend/screens/cart/cart_screen.dart';
import 'package:fyp_frontend/screens/notifications/notification_screen.dart';
import 'package:get/get.dart';

import 'components/categories.dart';
import 'components/home_page_products.dart';
import 'components/search_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "FastMart",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ));
            },
          ),
          IconButton(
            icon: Obx(
              () => (cartController.cartProducts.isNotEmpty)
                  ? const Icon(
                      CupertinoIcons.cart_fill,
                      color: primaryColor,
                    )
                  : const Icon(
                      Icons.production_quantity_limits,
                      color: Colors.grey,
                    ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchForm(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Categories(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Products",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Expanded(child: HomePageProducts()),
          ],
        ),
      ),
    );
  }
}
