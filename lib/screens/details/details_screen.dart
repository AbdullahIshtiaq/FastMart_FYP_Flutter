import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/config.dart';
import 'package:fyp_frontend/screens/details/components/alike_products.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/Wishlist.dart';
import 'package:fyp_frontend/utils/shared_preferences.dart';

import '../../models/Cart.dart';
import '../../models/MyProduct.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final MyProduct product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final cartController = Get.put(CartController());
  final wishlistController = Get.put(WishlistController());

  bool inCart = false;
  bool inWishlist = false;
  late MyProduct product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    print(product);
    inCart = checkInCart();
    inWishlist = checkInWishlist();
  }

  bool checkInWishlist() {
    for (var item in wishlistController.wishlistProducts) {
      if (item.productId == product.productId) {
        return true;
      }
    }
    return false;
  }

  bool checkInCart() {
    for (var item in cartController.cartProducts) {
      if (item.productId == product.productId) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFBF9),
      //backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              WishlistProduct model = WishlistProduct(
                  productBarcode: product.productBarcode,
                  productId: product.productId,
                  productImg: product.productImg,
                  productName: product.productName,
                  categoryId: product.category!.categoryId,
                  stockStatus: product.stockStatus,
                  productPrice: product.productPrice.toString());

              wishlistController.addProductToWishlist(model);
              UserSharedPreferences.setWishList(
                  wishlistController.wishlistProducts);
              setState(() {
                inWishlist = !inWishlist;
              });
            },
            icon: Icon(
              inWishlist ? CupertinoIcons.heart_solid : CupertinoIcons.heart,
              color: primaryColor,
              size: 20,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding * 2),
            child: Image.network(
              Config.imgURL + widget.product.productImg,
              height: MediaQuery.of(context).size.height * 0.25,
              //fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding * 2,
                  defaultPadding * 2, defaultPadding * 2, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.productName,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        "Rs. ${widget.product.productPrice}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      widget.product.productShortDesc.toString(),
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (product.stockStatus != "Out" &&
                              product.stockStatus != "out" &&
                              product.stockStatus != "OUT") {
                            CartProduct model = CartProduct(
                                productId: product.productId,
                                productImg: product.productImg,
                                productName: product.productName,
                                categoryId: product.category!.categoryId,
                                productPrice: product.productPrice.toString(),
                                qty: 1);

                            if (inCart) {
                              Get.snackbar(
                                "Removed Successfully",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );

                              cartController.removeProductFromCart(model);
                              UserSharedPreferences.setCartList(
                                  cartController.cartProducts);
                            } else {
                              Get.snackbar(
                                "Added Successfully",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );

                              cartController.addProductToCart(model);
                              //print(cartController.cartProducts);
                              UserSharedPreferences.setCartList(
                                  cartController.cartProducts);
                            }
                            setState(() {
                              inCart = !inCart;
                            });
                          } else {
                            Get.snackbar(
                              "Out of Stock",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 1),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: const StadiumBorder()),
                        child: inCart
                            ? const Text("Remove from Cart")
                            : const Text("Add to Cart"),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  const Text(
                    "More product like this",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: defaultPadding),
                  AlikeProductsScreen(
                    categoryId: product.category!.categoryId,
                  ),
                  const SizedBox(height: defaultPadding * 2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
