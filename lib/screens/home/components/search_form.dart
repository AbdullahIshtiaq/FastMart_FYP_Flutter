import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/screens/search/search_screen.dart';

import '../../../constants.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

// ignore: must_be_immutable
class SearchForm extends StatelessWidget {
  SearchForm({
    Key? key,
  }) : super(key: key);

  final searchFormKey = GlobalKey<FormState>();
  final mySearchController = TextEditingController();

  bool isAPICalled = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: searchFormKey,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
          boxShadow: [
            BoxShadow(
              color: lightGrey,
              blurRadius: 0.3,
              spreadRadius: 0.5,
              offset: Offset(0.5, 0.5), // shadow direction: bottom right
            )
          ],
        ),
        child: TextFormField(
          onSaved: (value) {
            value = value;
          },
          controller: mySearchController,
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
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
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
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onPressed: () {
                    if (isValidate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(
                              searchText: mySearchController.text,
                              fromToShopList: false,
                              toShopList: null,
                              toShopListController: null,
                            ),
                          ));
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
    );
  }

  bool isValidate() {
    if (searchFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
