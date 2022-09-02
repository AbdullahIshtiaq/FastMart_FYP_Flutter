import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/screens/toShopList/components/toShopList_product_card.dart';
import '../../models/ToShopList.dart';
import '../../utils/shared_preferences.dart';
import '../search/search_screen.dart';

class ToShopListScreen extends StatefulWidget {
  const ToShopListScreen({
    Key? key,
    //required this.toShopList,
    required this.index,
  }) : super(key: key);

  //final ToShopList toShopList;
  final int index;

  @override
  State<ToShopListScreen> createState() => _ToShopListScreenState();
}

class _ToShopListScreenState extends State<ToShopListScreen> {
  final ToShopListController toShopListController =
      Get.put(ToShopListController());

  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          toShopListController.toShopListProducts[index].title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding * 2, 0.0, defaultPadding * 2, defaultPadding * 2),
        child: Column(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        searchText: "",
                        fromToShopList: true,
                        toShopList:
                            toShopListController.toShopListProducts[index],
                        toShopListController: toShopListController,
                      ),
                    )).then((value) => {setState(() {})});

                // Dialog createListDialog = Dialog(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(
                //           defaultPadding)), //this right here
                //   child: Container(
                //     padding: const EdgeInsets.fromLTRB(defaultPadding,
                //         defaultPadding * 2, defaultPadding, defaultPadding * 4),
                //     child: const DialogBoxContent(),
                //   ),
                // );
                // showDialog(
                //     context: context,
                //     builder: (BuildContext context) => createListDialog);
              },
              icon: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Icon(
                  Icons.add_circle_outline,
                  size: 20,
                ),
              ),
              label: const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  "Product",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => (toShopListController
                        .toShopListProducts[index].listProducts.isNotEmpty)
                    ? GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3,
                        ),
                        itemBuilder: (context, innerIndex) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding / 2),
                          child: ToShopListProductCard(
                            product: toShopListController
                                .toShopListProducts[index]
                                .listProducts[innerIndex],
                            listId: toShopListController
                                .toShopListProducts[index].listId,
                            toShopListController: toShopListController,
                            press: () {
                              toShopListController.removeProductFromToShopList(
                                  toShopListController.toShopListProducts[index]
                                      .listProducts[innerIndex].productId,
                                  toShopListController
                                      .toShopListProducts[index].listId);

                              UserSharedPreferences.setToShopList(
                                  toShopListController.toShopListProducts);

                              setState(() {});
                            },
                          ),
                        ),
                        itemCount: toShopListController
                            .toShopListProducts[index].listProducts.length,
                        scrollDirection: Axis.vertical,
                      )
                    : Center(
                        child: Text(
                          "No product found",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
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
