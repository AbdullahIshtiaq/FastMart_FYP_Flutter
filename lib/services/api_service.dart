import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/models/MyCard.dart';
import 'package:fyp_frontend/models/MyDemand.dart';
import 'package:fyp_frontend/models/MyOffer.dart';
import 'package:fyp_frontend/models/OrderPayment.dart';
import 'package:http/http.dart' as http;
import 'package:fyp_frontend/config.dart';
import 'package:fyp_frontend/models/MyCategory.dart';
import 'package:fyp_frontend/models/MyOrder.dart';
import 'package:fyp_frontend/models/MyProduct.dart';
import 'package:fyp_frontend/models/OrderFilterModel.dart';
import 'package:fyp_frontend/models/ProductFilterModel.dart';
import 'package:fyp_frontend/models/login_request_model.dart';
import 'package:fyp_frontend/models/login_response_model.dart';
import 'package:fyp_frontend/models/register_response_model.dart';
import 'package:fyp_frontend/services/shared_service.dart';

import 'dart:developer' as developer;

import '../models/register_request_model.dart';

final apiService = Provider((ref) => APIService());

class APIService {
  static var client = http.Client();

  //////////////////////////////////////////////////////////////////////////
  // login
  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseModel(response.body));
      // print("Response 35: " + response.body);
      return true;
    } else {
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  // register
  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    print("In register api: ${response.body}");

    return registerResponseModel(response.body);
  }

  //////////////////////////////////////////////////////////////////////////
  // Get User Details
  static Future<String> getUserProfile(LoginRequestModel model) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails?.data.token}'
    };

    var url = Uri.http(Config.apiURL, Config.userProfileAPI);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  //////////////////////////////////////////////////////////
  /// Update/Save Token
  static Future<bool?> updateUserToken(token) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    LoginResponseModel? details = await SharedService.loginDetails();

    var url = Uri.http(Config.apiURL, Config.updateUserTokenAPI);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "userId": details?.data.id,
            "fcmToken": token,
          },
        ));

    if (response.statusCode == 200) {
      return true;
      // developer.log('log me 197: $data', name: 'my.app.API 155');
      // developer.log('log me 198: ${orderFromJson(data["data"])}',
      //     name: 'my.app.API 155');
    } else {
      //developer.log('log me 159: ', name: 'my.app.API 159');
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  /// Update User Profile
  static Future<bool?> updateUserProfile(user) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    //LoginResponseModel? details = await SharedService.loginDetails();

    var url = Uri.http(Config.apiURL, Config.updateProfileAPI);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "userId": user["id"],
            "username": user["name"],
            "email": user["email"],
            "phone": user["phone"],
            "city": user["city"],
          },
        ));

    if (response.statusCode == 200) {
      developer.log('log me 138: ${response.body}', name: 'my.app.API 155');
      return true;
    } else {
      developer.log('log me 143: ', name: 'my.app.API 159');
      return false;
    }
  }

  //////////////////////////////////////////////////////////
  /// Update Profile Image
  static Future<String?> updateUserImage(image, userId) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    //LoginResponseModel? details = await SharedService.loginDetails();

    var url = Uri.http(Config.apiURL, Config.updateUserImgAPI);

    var request = http.MultipartRequest("POST", url);

    request.fields["userId"] = userId;

    var userImg = await http.MultipartFile.fromPath("userImg", image.path);

    request.files.add(userImg);
    var response = await request.send();

    // var response = await client.post(url,
    //     headers: requestHeaders,
    //     body: jsonEncode(
    //       {
    //         "userId": userId,
    //         "userImg": image,
    //       },
    //     ));

    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var data = jsonDecode(responseString);
      //developer.log('log me 145: ${data['data']}', name: 'my.app.API 155');

      // developer.log('log me 145: ${data['data']['userImage']}',
      //     name: 'my.app.API 155');
      return data['data']['userImage'];
      // developer.log('log me 198: ${orderFromJson(data["data"])}',
      //     name: 'my.app.API 155');
    } else {
      developer.log('log me 150: ', name: 'my.app.API 159');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  // Get Categories
  Future<List<MyCategory>?> getCategories(page, pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };

    var url = Uri.http(Config.apiURL, Config.categoryAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //developer.log('log me 95: ${data["data"]}', name: 'my.app.category');
      return categoryFromJson(data["data"]);
    } else {
      // developer.log('log me', name: 'line 98:');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  // Get All Products
  static Future<List<MyProduct>?> getProducts(
      ProductFilterModel productFilterModel) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': productFilterModel.paginationModel.page.toString(),
      'pageSize': productFilterModel.paginationModel.pageSize.toString()
    };

    if (productFilterModel.categoryId != null) {
      queryString["categoryId"] = productFilterModel.categoryId!;
    }

    var url = Uri.http(Config.apiURL, Config.productAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //developer.log('log me 118: ${data}', name: 'my.app.product');
      // developer.log('log me 119: ${data["data"]}', name: 'my.app.product');
      // developer.log('log me 120: ${productFromJson(data["data"])}',
      //     name: 'my.app.product');
      return productFromJson(data["data"]);
    } else {
      //developer.log('log me', name: 'line 125:');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  // Get Products By Search
  static Future<List<MyProduct>?> getProduct(String? productName) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {'productName': productName!};

    var url = Uri.http(Config.apiURL, Config.productAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // developer.log('log me 139: ${data["data"]}', name: 'my.app.product');
      // developer.log('log me 140: ${productFromJson(data["data"]).length}',
      //     name: 'my.app.product');
      return productFromJson(data["data"]);
    } else {
      //developer.log('log me', name: 'line 125:');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  // Get Products By Barcode
  static Future<MyProduct?> getProductByBarcode(String? barcode) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {'productBarcode': barcode!};

    var url = Uri.http(Config.apiURL, Config.productByQRAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //developer.log('log me 139: ${data["data"]}', name: 'my.app.product');
      //developer.log('log me 140: ${productFromJson(data["data"]).length}',
      //   name: 'my.app.product');
      return productFromJson(data["data"])[0];
    } else {
      //developer.log('log me', name: 'line 125:');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  // Get Orders
  Future<List<MyOrder>?> getOrders(OrderFilterModel orderFilterModel) async {
    //developer.log('log me 213: ', name: 'my.app.API 213');
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': orderFilterModel.paginationModel.page.toString(),
      'pageSize': orderFilterModel.paginationModel.pageSize.toString()
    };

    //developer.log('log me 136: ${orderFilterModel.userId}',
    //   name: 'my.app.API 136');

    if (orderFilterModel.userId != null) {
      // developer.log('log me 225: ', name: 'my.app.API 225');
      queryString["orderUserID"] = orderFilterModel.userId!;
    }

    var url = Uri.http(Config.apiURL, Config.getOrderAPI, queryString);
    // developer.log('log me 230: $url', name: 'my.app.API 230');
    var response = await client.get(url, headers: requestHeaders);

    //developer.log('log me 148: $response', name: 'my.app.API 148');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      developer.log('log me 237: $data', name: 'my.app.API 237');
      // developer.log('log me 240: ${orderFromJson(data["data"])}',
      //     name: 'my.app.API 240');
      return orderFromJson(data["data"]);
    } else {
      developer.log('log me 242: ', name: 'my.app.API 242');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  //Payment

  static Future<Map<String, dynamic>> processPayment(cardDetails, model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.saveOrderAPI);
    developer.log('log me 253: $cardDetails', name: 'my.app.API 253');
    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "userId": model.orderUser,
            "card_Name": cardDetails["card_Name"],
            "card_Number": cardDetails["card_Number"],
            "card_ExpMonth": cardDetails["card_ExpMonth"],
            "card_ExpYear": cardDetails["card_ExpYear"],
            "card_CVC": cardDetails["card_CVC"],
            /////////////////////////////
            "orderNo": model.orderNo,
            "paymentMethod": model.paymentMethod,
            "orderDate": model.orderDate,
            "quantity": model.quantity,
            "total": model.total,
            "products": model.orderProducts,
            "orderDiscount": model.orderDiscount,
          },
        ));

    Map<String, dynamic> resModel = {};

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      resModel["message"] = "success";
      developer.log('log me 280: $data', name: 'my.app.API 280');
      resModel["data"] = OrderPayment.fromJson(data["data"]);

      // developer.log('log me 198: ${orderFromJson(data["data"])}',
      //     name: 'my.app.API 155');
    } else {
      developer.log('log me 284: ', name: 'my.app.API 284');
      var data = jsonDecode(response.body);
      resModel["message"] = data["message"];
    }

    return resModel;
  }

  //////////////////////////////////////////////////////////////////////////
  // Save Order By Cash

  static Future<String?> orderByCash(model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.saveCashOrderAPI);
    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "userId": model.orderUser,
            "orderNo": model.orderNo,
            "paymentMethod": model.paymentMethod,
            "orderDate": model.orderDate,
            "quantity": model.quantity,
            "total": model.total,
            "products": model.orderProducts,
          },
        ));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      developer.log('log me : ${data["data"]['orderId']}',
          name: 'my.app.API 280');
      return data["data"]['orderId'];
    } else {
      developer.log('log me 284: ', name: 'my.app.API 284');
      return null;
    }
  }

  static Future<bool?> updateOrder(orderId, transactionId) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.updateOrderAPI);
    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "orderId": orderId,
            "status": "Success",
            "transactionId": transactionId,
          },
        ));

    if (response.statusCode == 200) {
      return true;
      // developer.log('log me 197: $data', name: 'my.app.API 155');
      // developer.log('log me 198: ${orderFromJson(data["data"])}',
      //     name: 'my.app.API 155');
    } else {
      //developer.log('log me 159: ', name: 'my.app.API 159');
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  // Get Cards
  static Future<List<MyCard>?> getCards(String userId) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'cardUserID': userId,
    };
    var url = Uri.http(Config.apiURL, Config.getCardAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

//developer.log('log me 331: $response', name: 'my.app.API 331');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      developer.log('log me 338: $data', name: 'my.app.API 338');
      // developer.log('log me 238: ${orderFromJson(data["data"])}',
      //     name: 'my.app.API 238');
      return cardFromJson(data["data"]);
    } else {
      developer.log('log me 242: ', name: 'my.app.API 242');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  // Create Card
  static Future<MyCard?> createCard(cardDetails) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.createCardAPI);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "userId": cardDetails["userId"],
            "card_Name": cardDetails["card_Name"],
            "card_Number": cardDetails["card_Number"],
            "card_ExpMonth": cardDetails["card_ExpMonth"],
            "card_ExpYear": cardDetails["card_ExpYear"],
            "card_CVC": cardDetails["card_CVC"],
          },
        ));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      developer.log('log me 338: $data', name: 'my.app.API 338');
      developer.log('log me 368: ${MyCard.fromJson(data["data"])}',
          name: 'my.app.API 368');
      return MyCard.fromJson(data["data"]);
    } else {
      developer.log('log me 242: ', name: 'my.app.API 242');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  // Delete Card
  static Future<bool> deleteCard(cardId) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'cardId': cardId,
    };

    var url = Uri.http(Config.apiURL, Config.deleteCardAPI, queryString);

    var response = await client.delete(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      developer.log('log me 392: $data', name: 'my.app.API 392');
      return true;
    } else {
      developer.log('log me 395: ', name: 'my.app.API 395');
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  //Add Demand
  static Future<bool> createDemand(var demand) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print(demand);

    var url = Uri.http(Config.apiURL, Config.createDemandAPI);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode({
          "userId": demand["userId"],
          "message": demand['message'],
          "status": demand['status'],
        }));

    if (response.statusCode == 200) {
      print("Response 417: ${response.body}");
      return true;
    } else {
      print("Response 420: Failed");
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  // Get Demands
  static Future<List<MyDemand>?> getDemands(String userId) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'userId': userId,
    };
    var url = Uri.http(Config.apiURL, Config.getDemandAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      developer.log('log me 338: $data', name: 'my.app.API 338');
      // developer.log('log me 238: ${orderFromJson(data["data"])}',
      //     name: 'my.app.API 238');
      return DemandFromJson(data["data"]);
    } else {
      developer.log('log me 242: ', name: 'my.app.API 242');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  //Add Complaint
  static Future<bool> createComplaint(var complaint) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print(complaint);

    var url = Uri.http(Config.apiURL, Config.addComplaintAPI);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode({
          "userId": complaint["userId"],
          "message": complaint['message'],
          "title": complaint['title'],
        }));

    if (response.statusCode == 200) {
      print("Response 499: ${response.body}");
      return true;
    } else {
      print("Response 502: Failed");
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  //Get Active Offers
  static Future<List<MyOffer>?> getActiveOffers() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.getActiveOffersAPI);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // developer.log('log me 139: ${data["data"]}', name: 'my.app.product');
      // developer.log('log me 140: ${productFromJson(data["data"]).length}',
      //     name: 'my.app.product');
      return offerFromJson(data["data"]);
    } else {
      print("Response 526: Failed");
      return null;
    }
  }
}
