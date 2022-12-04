import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/config.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/models/Wishlist.dart';
import '../../../constants.dart';
import '../../../models/Cart.dart';
import '../../../models/ToShopList.dart';
import '../../../utils/shared_preferences.dart';

class ToShopListProductCard extends StatefulWidget {
  const ToShopListProductCard(
      {Key? key,
      required this.product,
      required this.press,
      required this.listId,
      required this.toShopListController})
      : super(key: key);

  final VoidCallback press;
  final WishlistProduct product;
  final String listId;
  final ToShopListController toShopListController;

  @override
  State<ToShopListProductCard> createState() => _ToShopListProductCardState();
}

class _ToShopListProductCardState extends State<ToShopListProductCard> {
  final cartController = Get.put(CartController());
  bool inCart = false;

  @override
  void initState() {
    super.initState();
    inCart = checkInCart();
    setState(() {});
  }

  bool checkInCart() {
    for (var item in cartController.cartProducts) {
      if (item.productId == widget.product.productId) {
        return true;
      }
    }
    return false;
  }

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
                color: bgColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
              child: Image.network(Config.imgURL + widget.product.productImg),
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
                    widget.product.productName,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Expanded(
                  child: Text(
                    "Rs ${widget.product.productPrice}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    inCart
                        ? Icons.download_done_outlined
                        : CupertinoIcons.cart_fill_badge_plus,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    if (widget.product.stockStatus != "Out" &&
                        widget.product.stockStatus != "out" &&
                        widget.product.stockStatus != "OUT") {
                      if (inCart) {
                        Get.snackbar(
                          "Already In Cart",
                          "",
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 1),
                        );
                      } else {
                        Get.snackbar(
                          "Added Successfully",
                          "",
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 1),
                        );
                        CartProduct model = CartProduct(
                            productId: widget.product.productId,
                            productImg: widget.product.productImg,
                            productName: widget.product.productName,
                            categoryId: widget.product.categoryId,
                            productPrice:
                                widget.product.productPrice.toString(),
                            qty: 1);

                        cartController.addProductToCart(model);
                        UserSharedPreferences.setCartList(
                            cartController.cartProducts);
                        setState(() {
                          inCart = true;
                        });
                      }
                    } else {
                      Get.snackbar(
                        "Out of Stock",
                        "",
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 1),
                      );
                    }
                  },
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.delete_solid,
                      color: primaryColor,
                    ),
                    onPressed: widget.press,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
