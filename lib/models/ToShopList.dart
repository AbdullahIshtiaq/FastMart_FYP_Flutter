// ignore: file_names
import 'dart:convert';

import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:fyp_frontend/models/Wishlist.dart';

import '../utils/shared_preferences.dart';

List<ToShopList> toShopListFromJson(String str) =>
    List<ToShopList>.from(json.decode(str).map((x) => ToShopList.fromJson(x)));

class ToShopList {
  ToShopList({
    required this.listId,
    required this.title,
    required this.listProducts,
  });

  late final String listId;
  late final String title;
  late final List<WishlistProduct> listProducts;

  ToShopList.fromJson(Map<String, dynamic> json) {
    listId = json['listId'];
    title = json['title'];
    listProducts = List.from(json['listProducts'])
        .map((e) => WishlistProduct.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['listId'] = listId;
    _data['title'] = title;
    _data['listProducts'] = listProducts.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ToShopListController extends GetxController {
  var toShopListProducts = [].obs;

  @override
  void onInit() {
    String str = UserSharedPreferences.getToShopList() ?? "";
    if (str != "") {
      List<ToShopList> list = toShopListFromJson(str);

      toShopListProducts.clear();
      toShopListProducts.addAll(
        list.where(
          (toShopListProducts) => list.every((item) => true),
        ),
      );
      developer.log('log me 53: $toShopListProducts',
          name: 'my.app.ToShopListController');
    }
    super.onInit();
  }

  void createToShopList(String title) {
    int listId = DateTime.now().millisecondsSinceEpoch;
    toShopListProducts.add(ToShopList(
      listId: listId.toString(),
      title: title,
      listProducts: [],
    ));
    update();
  }

  void addProductToToShopList(WishlistProduct product, String listId) {
    for (var item in toShopListProducts) {
      if (item.listId == listId) {
        item.listProducts.add(product);
        update();
        return;
      }
    }
  }

  get toShopProducts => toShopListProducts;

  void removeToShopList(String listId) {
    for (var item in toShopListProducts) {
      if (item.listId == listId) {
        toShopListProducts.remove(item);
        update();
        return;
      }
    }
  }

  void removeProductFromToShopList(String productId, String listId) {
    for (var item in toShopListProducts) {
      if (item.listId == listId) {
        item.listProducts
            .removeWhere((element) => element.productId == productId);
        update();
        return;
      }
    }
  }
}
