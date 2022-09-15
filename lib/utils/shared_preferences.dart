import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences? _sharedPreferences;

  static Future init() async {
    print("Line 23: In init()");
    _sharedPreferences = await SharedPreferences.getInstance();
    print("Line 25: In init() $_sharedPreferences");
  }

///// Cart
  static Future setCartList(RxList<dynamic> rxList) async {
    var mapInString = jsonEncode(rxList);
    print("Line 30: SetCart " + mapInString);
    await _sharedPreferences?.setString('cart', mapInString);
  }

  static String? getCartList() {
    String? mapInString;
    if (_sharedPreferences!.containsKey('cart')) {
      mapInString = _sharedPreferences!.getString('cart');
      print("Line 38: GetCart Found");
    } else {
      print("Line 38: GetCart Not Found");
    }
    return mapInString;
  }

  static void deleteCartList() {
    if (_sharedPreferences!.containsKey('cart')) {
      _sharedPreferences!.remove('cart');
      print("Line 52: Cart Deleted");
    }
  }

////Wishlist
  static Future setWishList(RxList<dynamic> rxList) async {
    var mapInString = jsonEncode(rxList);
    print("Line 30: SetCart " + mapInString);
    await _sharedPreferences?.setString('wishlist', mapInString);
  }

  static String? getWishList() {
    String? mapInString;
    if (_sharedPreferences!.containsKey('wishlist')) {
      mapInString = _sharedPreferences!.getString('wishlist');
      print("Line 38: GetCart Found");
    } else {
      print("Line 38: GetCart Not Found");
    }
    return mapInString;
  }

  static void deleteWishList() {
    if (_sharedPreferences!.containsKey('wishlist')) {
      _sharedPreferences!.remove('wishlist');
      print("Line 52: Cart Deleted");
    }
  }

/////ToShopList
  static Future setToShopList(RxList<dynamic> rxList) async {
    var mapInString = jsonEncode(rxList);
    print("Line 30: SetToShopList " + mapInString);
    await _sharedPreferences?.setString('toShopList', mapInString);
  }

  static String? getToShopList() {
    String? mapInString;
    if (_sharedPreferences!.containsKey('toShopList')) {
      mapInString = _sharedPreferences!.getString('toShopList');
      print("Line 38: GetToShopList Found");
    } else {
      print("Line 38: GetToShopList Not Found");
    }
    return mapInString;
  }

  static void deleteToShopList() {
    if (_sharedPreferences!.containsKey('toShopList')) {
      _sharedPreferences!.remove('toShopList');
      print("Line 52: ToShopList Deleted");
    }
  }

  /////Notification
  static Future setNotification(RxList<dynamic> rxList) async {
    var mapInString = jsonEncode(rxList);
    print("Line 94: SetNotification " + mapInString);
    await _sharedPreferences?.setString('notification', mapInString);
  }

  static String? getNotification() {
    String? mapInString;
    if (_sharedPreferences!.containsKey('notification')) {
      mapInString = _sharedPreferences!.getString('notification');
      print("Line 102: GetNotification Found");
    } else {
      print("Line 104: GetNotification Not Found");
    }
    return mapInString;
  }

  static void deleteNotification() {
    if (_sharedPreferences!.containsKey('notification')) {
      _sharedPreferences!.remove('notification');
      print("Line 112: Notification Deleted");
    }
  }
}
