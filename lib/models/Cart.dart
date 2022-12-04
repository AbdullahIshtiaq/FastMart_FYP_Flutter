import 'dart:convert';
import 'dart:developer' as developer;

import 'package:fyp_frontend/models/Wishlist.dart';
import 'package:get/get.dart';

import '../services/api_service.dart';
import '../utils/shared_preferences.dart';

List<CartProduct> cartProductFromJson(String str) => List<CartProduct>.from(
    json.decode(str).map((x) => CartProduct.fromJson(x)));

class CartProduct {
  CartProduct({
    required this.productId,
    required this.productName,
    required this.productImg,
    required this.productPrice,
    required this.categoryId,
    required this.qty,
  });

  late final String productId;
  late final String productName;
  late final String productImg;
  late final String productPrice;
  late final String categoryId;
  late int qty;

  CartProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productImg = json['productImg'];
    productPrice = json['productPrice'];
    categoryId = json['categoryId'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['productId'] = productId;
    _data['productName'] = productName;
    _data['productImg'] = productImg;
    _data['productPrice'] = productPrice;
    _data['categoryId'] = categoryId;
    _data['qty'] = qty;
    return _data;
  }
}

class CartController extends GetxController {
  var cartProducts = [].obs;
  int total = 0;
  int discount = 0;
  String offerAvalied = "";

  @override
  void onInit() {
    String str = UserSharedPreferences.getCartList() ?? "";
    if (str != "") {
      List<CartProduct> list = cartProductFromJson(str);

      cartProducts.clear();
      cartProducts.addAll(
        list.where(
          (cartProducts) => list.every((item) => true),
        ),
      );
      developer.log('log me 53: $cartProducts', name: 'my.app.productDetail');
    }
    super.onInit();
  }

  void addProductToCart(CartProduct product) {
    for (var item in cartProducts) {
      if (item.productId == product.productId) {
        print("Line 72: ${item.qty}");
        item.qty += 1;
        print("Line 74: ${item.qty}");
        update();
        return;
      }
    }

    cartProducts.add(product);
    update();
  }

  get products => cartProducts;

  void minusProductFromCart(CartProduct product) {
    for (var item in cartProducts) {
      if (item.productId == product.productId) {
        if (item.qty != 1) {
          item.qty -= 1;
          update();
        } else {
          return;
        }
      }
    }
  }

  void removeProductFromCart(CartProduct product) {
    cartProducts
        .removeWhere((element) => element.productId == product.productId);
    update();
  }

  get subTotal => cartProducts
      .map((item) => double.parse(item.productPrice) * item.qty)
      .toList()
      .reduce((value, element) => value + element)
      .toString();

  get grandTotal => total;

  get discountAmount => discount;

  Future<bool> calculateOffers() async {
    total = 0;
    discount = 0;
    offerAvalied = "";
    bool isFound = false;
    return await APIService.getActiveOffers().then((offerList) {
      if (offerList != null) {
        print("Line 140: Offer list is not null");
        for (var item in cartProducts) {
          print("Line 142: Product $cartProducts");
          isFound = false;
          for (var offer in offerList) {
            if (item.categoryId == offer.categoryId!.categoryId) {
              isFound = true;
              print("Line 144: Discount Found");
              discount +=
                  ((double.parse(item.productPrice) * (offer.discount / 100)) *
                          item.qty)
                      .toInt();
              total += (((double.parse(item.productPrice) -
                          (double.parse(item.productPrice) *
                              (offer.discount / 100)))) *
                      item.qty)
                  .toInt();
              offerAvalied =
                  "${offer.discount}% off on ${offer.categoryId!.categoryName}";
              break;
            }
          }
          if (!isFound) {
            total += ((double.parse(item.productPrice)) * item.qty).toInt();
          }
        }
        print("Line 146: Total after is: $total");
        return true;
      } else {
        return false;
      }
    });
  }
}
