// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/ToShopList.dart';
import 'package:fyp_frontend/screens/toShopList/components/toShop_card.dart';
import '../../utils/shared_preferences.dart';
import 'components/toShop_input_form.dart';

class ToShopScreen extends StatefulWidget {
  const ToShopScreen({Key? key}) : super(key: key);

  @override
  State<ToShopScreen> createState() => _ToShopScreenState();
}

class _ToShopScreenState extends State<ToShopScreen> {
  @override
  Widget build(BuildContext context) {
    final myListNameController = TextEditingController();

    final ToShopListController toShopListController =
        Get.put(ToShopListController());

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "To Shop",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding * 2, 0.0, defaultPadding * 2, defaultPadding * 2),
        child: Column(
          children: [
            Expanded(
              child: (toShopListController.toShopListProducts.length != 0)
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
                        child: ToShopCard(
                          toShopList:
                              toShopListController.toShopListProducts[index],
                          index: index,
                          press: () {
                            toShopListController.removeToShopList(
                                toShopListController
                                    .toShopListProducts[index].listId);
                            UserSharedPreferences.setToShopList(
                                toShopListController.toShopListProducts);
                            setState(() {});
                          },
                          toShopListController: toShopListController,
                        ),
                      ),
                      itemCount: toShopListController.toShopListProducts.length,
                      scrollDirection: Axis.vertical,
                    )
                  : Center(
                      child: Text(
                        "No List Found",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Dialog createListDialog = Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(defaultPadding)), //this right here
              child: Container(
                padding: const EdgeInsets.fromLTRB(defaultPadding,
                    defaultPadding * 2, defaultPadding, defaultPadding * 4),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Form(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return 'Name required';
                            }
                          },
                          controller: myListNameController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: bgColor,
                            hintText: "List Name",
                            border: outlineInputBorder,
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: outlineInputBorder,
                            focusedBorder: outlineInputBorder,
                            errorBorder: outlineInputBorder,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            String title = myListNameController.text;
                            if (title.isEmpty) {
                              Get.snackbar(
                                "Name Required",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );
                              myListNameController.printError();
                            } else {
                              toShopListController.createToShopList(title);

                              UserSharedPreferences.setToShopList(
                                  toShopListController.toShopListProducts);

                              Get.snackbar(
                                "Created Successfully",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );

                              Navigator.of(context, rootNavigator: true).pop();
                              setState(() {});
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: const StadiumBorder()),
                          child: const Text("Create"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
            showDialog(
                context: context,
                builder: (BuildContext context) => createListDialog);
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
