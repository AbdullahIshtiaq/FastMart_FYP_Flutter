import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/models/MyProduct.dart';
import 'package:fyp_frontend/models/ToShopList.dart';
import 'package:fyp_frontend/screens/search/components/searched_product_card.dart';
import 'package:fyp_frontend/screens/search/components/searched_toshop_product_card.dart';

import '../../../constants.dart';
import '../../../services/api_service.dart';
import '../../utils/my_text.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  const SearchScreen(
      {Key? key,
      required this.searchText,
      required this.fromToShopList,
      required this.toShopList,
      required this.toShopListController})
      : super(key: key);

  final String searchText;
  final bool fromToShopList;
  final ToShopList? toShopList;
  final ToShopListController? toShopListController;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchKey = GlobalKey<FormState>();

  final searchController = TextEditingController();

  List<MyProduct> products = [];

  bool isAPICalled = false;

  late bool fromToShopList;
  ToShopList? toShopList;

  @override
  initState() {
    super.initState();
    searchController.text = widget.searchText;
    fromToShopList = widget.fromToShopList;
    toShopList = widget.toShopList;
    if (searchController.text.isNotEmpty) {
      searchProduct();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Search Result",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Form(
              key: searchKey,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(defaultBorderRadius)),
                  boxShadow: [
                    BoxShadow(
                      color: lightGrey,
                      blurRadius: 0.3,
                      spreadRadius: 0.5,
                      offset: Offset(0.5, 0.5),
                    )
                  ],
                ),
                child: TextFormField(
                  onSaved: (value) {
                    value = value;
                  },
                  controller: searchController,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Value Required';
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    errorBorder: outlineInputBorder,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding, vertical: defaultPadding),
                      child: SizedBox(
                        width: 90,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                          onPressed: () {
                            if (isValidate()) {
                              searchProduct();
                            } else {
                              Get.snackbar(
                                "Invalid Input",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );
                            }
                          },
                          child: const Text("Search"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: (products.isEmpty)
                ? (isAPICalled)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    :
                    //  const Center(
                    //     child: Text("No Product Found"),
                    //   )
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 250,
                          margin: const EdgeInsets.only(bottom: 130),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.find_in_page,
                                  size: 100, color: Colors.grey[300]),
                              Container(height: 15),
                              Text("No Product Found",
                                  style: MyText.title(context)!.copyWith(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold)),
                              Container(height: 5),
                              Text("Try more general keyword",
                                  style: MyText.subhead(context)!
                                      .copyWith(color: Colors.grey[800])),
                            ],
                          ),
                        ),
                      )
                : Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding / 2),
                        child: (!fromToShopList)
                            ? SearchedProductCard(
                                product: products[index],
                                index: index,
                              )
                            : SearchedToShopProductCard(
                                product: products[index],
                                index: index,
                                listId: toShopList!.listId,
                                toShopListController:
                                    widget.toShopListController!,
                              ),
                      ),
                      itemCount: products.length,
                      scrollDirection: Axis.vertical,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  bool isValidate() {
    if (searchKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> searchProduct() async {
    print("Line 125: In Start");

    if (isAPICalled) {
      return;
    }

    isAPICalled = true;

    print("Line 137: In Middle");

    final searchedProducts = await APIService.getProduct(searchController.text);
    if (searchedProducts != null && searchedProducts.isNotEmpty) {
      print("Line 212: Found");
      setState(() {
        isAPICalled = false;
        products = searchedProducts;
      });
      Get.snackbar(
        "Product Found Successfully",
        "",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    } else {
      print("Line 224: Not Found");
      setState(() {
        isAPICalled = false;
      });
      Get.snackbar(
        "Product Not Found Successfully",
        "",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    }
    print("Line 148: In End");
  }
}
