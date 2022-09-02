import 'dart:convert';
import 'dart:developer' as developer;

import 'package:get/get.dart';

import '../utils/shared_preferences.dart';

List<CartProduct> cartProductFromJson(String str) => List<CartProduct>.from(
    json.decode(str).map((x) => CartProduct.fromJson(x)));

class CartProduct {
  CartProduct({
    required this.productId,
    required this.productName,
    required this.productImg,
    required this.productPrice,
    required this.qty,
  });

  late final String productId;
  late final String productName;
  late final String productImg;
  late final String productPrice;
  late int qty;

  CartProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productImg = json['productImg'];
    productPrice = json['productPrice'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['productId'] = productId;
    _data['productName'] = productName;
    _data['productImg'] = productImg;
    _data['productPrice'] = productPrice;
    _data['qty'] = qty;
    return _data;
  }
}

class CartController extends GetxController {
  var cartProducts = [].obs;

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
        print("Line 72: " + item.qty.toString());
        item.qty += 1;
        print("Line 74: " + item.qty.toString());
        update();
        return;
      }
    }

    cartProducts.add(CartProduct(
        productId: product.productId,
        productImg: product.productImg,
        productName: product.productName,
        productPrice: product.productPrice,
        qty: 1));
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

  // get subTotal => cartProducts
  //     .map((product) => int.parse(product.productPrice) * product.qty)
  //     .toList();

  // double getTotal() {
  //   double total = 0;
  //   for (var item in cartProducts) {
  //     developer.log('log me 110: $item.productPrice)', name: 'my.app.Total');
  //     total += ((double.parse(item.productPrice) * item.qty));
  //   }
  //   developer.log('log me 112: $total', name: 'my.app.Total');
  //   print("Line 114: " + total.toString());
  //   return total;
  // }

  //get total => getTotal().obs;

  get total => cartProducts
      .map((item) => double.parse(item.productPrice) * item.qty)
      .toList()
      .reduce((value, element) => value + element)
      .toString();

// get total => cartProducts
//     .map((product) => int.parse(product.productPrice) * product.qty)
//     .toList()
//     .reduce((value, element) => value + element)
//     .toString();
}
