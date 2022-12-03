import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/config.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/models/MyCategory.dart';
import 'package:fyp_frontend/models/MyProduct.dart';
import 'package:fyp_frontend/models/Wishlist.dart';

import '../../../constants.dart';
import '../../../models/Cart.dart';
import '../../../utils/shared_preferences.dart';
import '../../details/details_screen.dart';

class WishlistProductCard extends StatefulWidget {
  const WishlistProductCard({
    Key? key,
    required this.wishlistController,
    required this.product,
    required this.index,
  }) : super(key: key);

  final WishlistController wishlistController;
  final WishlistProduct product;
  final int index;

  @override
  State<WishlistProductCard> createState() => _WishlistProductCardState();
}

class _WishlistProductCardState extends State<WishlistProductCard> {
  late WishlistProduct product;

  final cartController = Get.put(CartController());
  bool inCart = false;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    inCart = checkInCart();
    setState(() {});
  }

  bool checkInCart() {
    for (var item in cartController.cartProducts) {
      if (item.productId == product.productId) {
        return true;
      }
    }
    return false;
  }

  String splitImgPath(String string, String separator, {int max = 0}) {
    List<String> result = [];

    if (separator.isEmpty) {
      result.add(string);
      return "";
    }

    while (true) {
      var index = string.indexOf(separator, 0);
      if (index == -1 || (max > 0 && result.length >= max)) {
        result.add(string);
        break;
      }

      result.add(string.substring(0, index));
      string = string.substring(index + separator.length);
    }
    return "/${result[3]}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyProduct model = MyProduct(
            productBarcode: product.productBarcode,
            productName: product.productName,
            category: MyCategory(
                categoryName: "",
                categoryId: product.categoryId,
                categoryImg: ""),
            productShortDesc: "",
            productPrice: (double.parse(product.productPrice)),
            productRetailPrice: 0.0,
            productImg: product.productImg,
            productId: product.productId);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(product: model),
            )).then((_) => setState(() {
              inCart = checkInCart();
            }));
      },
      child: Container(
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
                // Image.asset(
                //   widget.product.image,
                //   //height: 100,
                // ),
              ),
            ),
            const SizedBox(width: defaultPadding / 2),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.productName,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Expanded(
                    child: Text(
                      "Rs. ${widget.product.productPrice}",
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
                            productId: product.productId,
                            productImg: product.productImg,
                            productName: product.productName,
                            categoryId: product.categoryId,
                            productPrice: product.productPrice.toString(),
                            qty: 1);

                        cartController.addProductToCart(model);
                        UserSharedPreferences.setCartList(
                            cartController.cartProducts);
                        setState(() {
                          inCart = true;
                        });
                      }
                    },
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.delete_solid,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        widget.wishlistController
                            .removeProductFromWishlist(widget.product);
                        UserSharedPreferences.setWishList(
                            widget.wishlistController.wishlistProducts);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
