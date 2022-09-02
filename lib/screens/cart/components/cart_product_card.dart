import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:fyp_frontend/utils/shared_preferences.dart';

import '../../../constants.dart';
import '../../../models/Cart.dart';

class CartProductCard extends StatefulWidget {
  const CartProductCard({
    Key? key,
    required this.cartController,
    required this.cartProduct,
  }) : super(key: key);

  final CartController cartController;
  final CartProduct cartProduct;

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        //color: Colors.white,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
              child: Image.network(widget.cartProduct.productImg),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.cartProduct.productName,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Rs. ${widget.cartProduct.productPrice}",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.minus_square,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        //setState(() {
                        widget.cartController
                            .minusProductFromCart(widget.cartProduct);
                        UserSharedPreferences.setCartList(
                            widget.cartController.cartProducts);
                        // });
                      },
                    ),
                    GetBuilder<CartController>(
                      builder: (control) => Text(
                        widget.cartProduct.qty.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(
                          CupertinoIcons.plus_app,
                          color: primaryColor,
                        ),
                        onPressed: () {
                          // setState(() {
                          widget.cartController
                              .addProductToCart(widget.cartProduct);
                          UserSharedPreferences.setCartList(
                              widget.cartController.cartProducts);
                          //  });
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.delete_solid,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        widget.cartController
                            .removeProductFromCart(widget.cartProduct);
                        UserSharedPreferences.setCartList(
                            widget.cartController.cartProducts);
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
