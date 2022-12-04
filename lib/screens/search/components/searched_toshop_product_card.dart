import 'package:flutter/material.dart';
import 'package:fyp_frontend/models/MyProduct.dart';
import 'package:fyp_frontend/models/Wishlist.dart';
import 'package:fyp_frontend/utils/shared_preferences.dart';

import '../../../constants.dart';
import '../../../models/ToShopList.dart';
import '../../details/details_screen.dart';

class SearchedToShopProductCard extends StatefulWidget {
  const SearchedToShopProductCard(
      {Key? key,
      required this.product,
      required this.index,
      required this.listId,
      required this.toShopListController})
      : super(key: key);

  final MyProduct product;
  final int index;
  final String listId;
  final ToShopListController toShopListController;

  @override
  State<SearchedToShopProductCard> createState() =>
      _SearchedToShopProductCardState();
}

class _SearchedToShopProductCardState extends State<SearchedToShopProductCard> {
  late MyProduct product;

  bool inList = false;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    inList = checkInToShopList();
    setState(() {});
  }

  bool checkInToShopList() {
    for (ToShopList item in widget.toShopListController.toShopListProducts) {
      if (item.listId == widget.listId) {
        for (var element in item.listProducts) {
          if (element.productId == product.productId) {
            return true;
          }
        }
        return false;
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
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
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
                  Expanded(
                    child: Text(
                      widget.product.productName,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Expanded(
                    child: Text(
                      "Rs. ${widget.product.productPrice}",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 150,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!inList) {
                              WishlistProduct obj = WishlistProduct(
                                  productBarcode: product.productBarcode,
                                  productId: product.productId,
                                  productName: product.productName,
                                  productImg: product.productImg,
                                  stockStatus: product.stockStatus,
                                  categoryId: product.category!.categoryId,
                                  productPrice:
                                      product.productPrice.toString());

                              widget.toShopListController
                                  .addProductToToShopList(obj, widget.listId);

                              UserSharedPreferences.setToShopList(widget
                                  .toShopListController.toShopListProducts);

                              inList = true;

                              setState(() {});
                            } else {
                              widget.toShopListController
                                  .removeProductFromToShopList(
                                      product.productId, widget.listId);
                              UserSharedPreferences.setToShopList(widget
                                  .toShopListController.toShopListProducts);
                              inList = false;
                              setState(() {});
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: const StadiumBorder()),
                          child: !inList
                              ? const Text(
                                  "Add To List",
                                  style: TextStyle(fontSize: 12),
                                )
                              : const Text(
                                  "Remove From List",
                                  style: TextStyle(fontSize: 12),
                                ),
                        ),
                      ),
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
