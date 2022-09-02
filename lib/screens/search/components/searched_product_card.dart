import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/models/MyProduct.dart';
import 'package:fyp_frontend/models/Wishlist.dart';

import '../../../constants.dart';
import '../../../models/Cart.dart';
import '../../../utils/shared_preferences.dart';
import '../../details/details_screen.dart';

class SearchedProductCard extends StatefulWidget {
  const SearchedProductCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final MyProduct product;
  final int index;

  @override
  State<SearchedProductCard> createState() => _SearchedProductCardState();
}

class _SearchedProductCardState extends State<SearchedProductCard> {
  late MyProduct product;

  final WishlistController wishlistController = Get.put(WishlistController());
  final cartController = Get.put(CartController());
  bool inCart = false;
  bool inWishlist = false;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    inCart = checkInCart();
    inWishlist = checkInWishlist();
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

  bool checkInWishlist() {
    for (var item in wishlistController.wishlistProducts) {
      if (item.productId == product.productId) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(product: product),
            )).then((_) => setState(() {
              inCart = checkInCart();
              inWishlist = checkInWishlist();
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
                child: Image.network(widget.product.fullImagePath),
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
                  Text(
                    "Rs. ${widget.product.productPrice}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        inWishlist
                            ? CupertinoIcons.heart_solid
                            : CupertinoIcons.heart,
                        color: primaryColor,
                        size: 20,
                      ),
                      onPressed: () {
                        WishlistProduct model = WishlistProduct(
                            productBarcode: product.productBarcode,
                            productId: product.productId,
                            productImg: product.fullImagePath,
                            productName: product.productName,
                            productPrice: product.productPrice.toString());

                        wishlistController.addProductToWishlist(model);
                        UserSharedPreferences.setWishList(
                            wishlistController.wishlistProducts);
                        setState(() {
                          inWishlist = !inWishlist;
                        });
                      },
                    ),
                  ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
