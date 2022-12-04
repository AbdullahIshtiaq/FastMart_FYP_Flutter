import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/Cart.dart';
import '../../utils/my_text.dart';
import '../checkout/checkout_screen.dart';
import 'components/cart_product_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "My Cart",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding * 2, 0.0, defaultPadding * 2, defaultPadding * 2),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => (cartController.products.isNotEmpty)
                    ? GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3,
                        ),
                        itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding / 2),
                            child: CartProductCard(
                              cartProduct: cartController.cartProducts[index],
                              cartController: cartController,
                            )),
                        itemCount: cartController.products.length,
                        scrollDirection: Axis.vertical,
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.production_quantity_limits,
                                  size: 100, color: Colors.grey[300]),
                              Container(height: 15),
                              Text("Cart is Empty",
                                  style: MyText.title(context)!.copyWith(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Subtotal:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        GetBuilder<CartController>(
                          builder: (control) =>
                              (cartController.products.isNotEmpty)
                                  ? Text(
                                      "Rs. ${cartController.subTotal}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                    )
                                  : Text(
                                      "Rs. 0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                    ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding * 2),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (cartController.cartProducts.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckoutScreen(),
                              ));
                        } else {
                          Get.snackbar(
                            "Cart is Empty",
                            "",
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 1),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: const StadiumBorder()),
                      child: const Text("Check Out"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
