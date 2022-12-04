import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/Wishlist.dart';
import '../../utils/my_text.dart';
import 'components/wishlist_product_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Wishlist",
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
                () => (wishlistController.wishlistProducts.isNotEmpty)
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
                          child: WishlistProductCard(
                            product: wishlistController.wishlistProducts[index],
                            wishlistController: wishlistController,
                            index: index,
                          ),
                        ),
                        itemCount: wishlistController.wishlistProducts.length,
                        scrollDirection: Axis.vertical,
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(CupertinoIcons.heart_fill,
                                  size: 100, color: Colors.grey[300]),
                              Container(height: 15),
                              Text("Wishlist is empty",
                                  style: MyText.title(context)!.copyWith(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
