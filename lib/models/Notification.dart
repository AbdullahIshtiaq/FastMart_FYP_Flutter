import 'dart:convert';

import 'package:get/get.dart';
import 'dart:developer' as developer;

import '../utils/shared_preferences.dart';

//////////////////////////////////////////////////////////////////////////////
/// Ad Notification Model
List<AdNotifications> adNotificationFromJson(String str) =>
    List<AdNotifications>.from(
        json.decode(str).map((x) => AdNotifications.fromJson(x)));

class AdNotifications {
  AdNotifications({
    required this.notificationTitle,
    required this.notificationDescription,
    required this.notificationCreatedDateTime,
    required this.notificationAdType,
    required this.notificationImage,
    required this.notificationDateTime,
    required this.notificationType,
    required this.isRead,
  });

  late final String notificationTitle;
  late final String notificationDescription;
  late final String notificationCreatedDateTime;
  late final String notificationAdType;
  late final String notificationImage;
  late final String notificationDateTime;
  late final String notificationType;
  late final bool isRead;

  AdNotifications.fromJson(Map<String, dynamic> json) {
    notificationTitle = json['notificationTitle'];
    notificationDescription = json['notificationDescription'];
    notificationCreatedDateTime = json['notificationCreatedDateTime'];
    notificationAdType = json['notificationAdType'];
    notificationImage = json['notificationImage'];
    notificationDateTime = json['notificationDateTime'];
    notificationType = json['notificationType'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['notificationTitle'] = notificationTitle;
    _data['notificationDescription'] = notificationDescription;
    _data['notificationCreatedDateTime'] = notificationCreatedDateTime;
    _data['notificationAdType'] = notificationAdType;
    _data['notificationImage'] = notificationImage;
    _data['notificationDateTime'] = notificationDateTime;
    _data['notificationType'] = notificationType;
    _data['isRead'] = isRead;
    return _data;
  }
}

//////////////////////////////////////////////////////////////////////////////
/// Offer Notification Model
List<OfferNotifications> offerNotificationFromJson(String str) =>
    List<OfferNotifications>.from(
        json.decode(str).map((x) => OfferNotifications.fromJson(x)));

class OfferNotifications {
  OfferNotifications({
    required this.notificationTitle,
    required this.notificationDescription,
    required this.notificationCreatedDateTime,
    required this.notificationAdType,
    required this.notificationStartDate,
    required this.notificationEndDate,
    required this.notificationDiscount,
    required this.notificationCategoryName,
    required this.notificationDateTime,
    required this.notificationType,
    required this.isRead,
  });

  late final String notificationTitle;
  late final String notificationDescription;
  late final String notificationCreatedDateTime;
  late final String notificationAdType;
  late final String notificationStartDate;
  late final String notificationEndDate;
  late final String notificationDiscount;
  late final String notificationCategoryName;
  late final String notificationDateTime;
  late final String notificationType;
  late final bool isRead;

  OfferNotifications.fromJson(Map<String, dynamic> json) {
    notificationTitle = json['notificationTitle'];
    notificationDescription = json['notificationDescription'];
    notificationCreatedDateTime = json['notificationCreatedDateTime'];
    notificationAdType = json['notificationAdType'];
    notificationStartDate = json['notificationStartDate'];
    notificationEndDate = json['notificationEndDate'];
    notificationDiscount = json['notificationDiscount'];
    notificationCategoryName = json['notificationCategoryName'];
    notificationDateTime = json['notificationDateTime'];
    notificationType = json['notificationType'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['notificationTitle'] = notificationTitle;
    _data['notificationDescription'] = notificationDescription;
    _data['notificationCreatedDateTime'] = notificationCreatedDateTime;
    _data['notificationAdType'] = notificationAdType;
    _data['notificationStartDate'] = notificationStartDate;
    _data['notificationEndDate'] = notificationEndDate;
    _data['notificationDiscount'] = notificationDiscount;
    _data['notificationCategoryName'] = notificationCategoryName;
    _data['notificationDateTime'] = notificationDateTime;
    _data['notificationType'] = notificationType;
    _data['isRead'] = isRead;
    return _data;
  }
}

//////////////////////////////////////////////////////////////////////////////
/// Order Notification Model
List<OrderNotifications> orderNotificationFromJson(String str) =>
    List<OrderNotifications>.from(
        json.decode(str).map((x) => OrderNotifications.fromJson(x)));

class OrderNotifications {
  OrderNotifications({
    required this.notificationOrderNo,
    required this.notificationOrderDate,
    required this.notificationOrderTime,
    required this.notificationTotal,
    required this.notificationOrderPaymentMethod,
    required this.notificationMessage,
    required this.notificationDateTime,
    required this.notificationType,
    required this.isRead,
  });

  late final String notificationOrderNo;
  late final String notificationOrderDate;
  late final String notificationOrderTime;
  late final String notificationTotal;
  late final String notificationOrderPaymentMethod;
  late final String notificationMessage;
  late final String notificationDateTime;
  late final String notificationType;
  late final bool isRead;

  OrderNotifications.fromJson(Map<String, dynamic> json) {
    notificationOrderNo = json['notificationOrderNo'];
    notificationOrderDate = json['notificationOrderDate'];
    notificationOrderTime = json['notificationOrderTime'];
    notificationTotal = json['notificationTotal'];
    notificationOrderPaymentMethod = json['notificationOrderPaymentMethod'];
    notificationMessage = json['notificationMessage'];
    notificationDateTime = json['notificationDateTime'];
    notificationType = json['notificationType'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['notificationOrderNo'] = notificationOrderNo;
    _data['notificationOrderDate'] = notificationOrderDate;
    _data['notificationOrderTime'] = notificationOrderTime;
    _data['notificationTotal'] = notificationTotal;
    _data['notificationOrderPaymentMethod'] = notificationOrderPaymentMethod;
    _data['notificationMessage'] = notificationMessage;
    _data['notificationDateTime'] = notificationDateTime;
    _data['notificationType'] = notificationType;
    _data['isRead'] = isRead;
    return _data;
  }
}

//////////////////////////////////////////////////////////////////////////////
/// Order Notification Model
List<DemandNotifications> demandNotificationFromJson(String str) =>
    List<DemandNotifications>.from(
        json.decode(str).map((x) => DemandNotifications.fromJson(x)));

class DemandNotifications {
  DemandNotifications({
    required this.notificationDemandId,
    required this.notificationDemandProgress,
    required this.notificationDemandCreatedDateTime,
    required this.notificationMessage,
    required this.notificationResponse,
    required this.notificationDateTime,
    required this.notificationType,
    required this.isRead,
  });

  late final String notificationDemandId;
  late final String notificationDemandProgress;
  late final String notificationDemandCreatedDateTime;
  late final String notificationMessage;
  late final String notificationResponse;
  late final String notificationDateTime;
  late final String notificationType;
  late final bool isRead;

  DemandNotifications.fromJson(Map<String, dynamic> json) {
    notificationDemandId = json['notificationDemandId'];
    notificationDemandProgress = json['notificationDemandProgress'];
    notificationDemandCreatedDateTime =
        json['notificationDemandCreatedDateTime'];
    notificationMessage = json['notificationMessage'];
    notificationResponse = json['notificationResponse'];
    notificationDateTime = json['notificationDateTime'];
    notificationType = json['notificationType'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['notificationDemandId'] = notificationDemandId;
    _data['notificationDemandProgress'] = notificationDemandProgress;
    _data['notificationDemandCreatedDateTime'] =
        notificationDemandCreatedDateTime;
    _data['notificationMessage'] = notificationMessage;
    _data['notificationResponse'] = notificationResponse;
    _data['notificationDateTime'] = notificationDateTime;
    _data['notificationType'] = notificationType;
    _data['isRead'] = isRead;
    return _data;
  }
}

//////////////////////////////////////////////////////////////////////////
/// Notification Controller
class NotificationController extends GetxController {
  var adNotificationsList = [].obs;
  var offerNotificationsList = [].obs;
  var orderNotificationsList = [].obs;
  var demandNotificationsList = [].obs;

  //var customerSupportList = [].obs;

  @override
  void onInit() {
    print('Notification Controller Init');
    initializeAdList();
    initializeOfferList();
    initializeOrderList();
    initializeDemandList();
    super.onInit();
  }

  void initializeAdList() {
    adNotificationsList.clear();
    String adData = UserSharedPreferences.getAdNotification() ?? "";
    if (adData != "") {
      List<AdNotifications> list = adNotificationFromJson(adData);
      adNotificationsList.addAll(
        list.where(
          (notifications) => list.every((item) => true),
        ),
      );
      developer.log('log me 252: ${adNotificationsList.length}',
          name: 'my.app.Notification');
    }
  }

  void initializeOfferList() {
    offerNotificationsList.clear();
    String offerData = UserSharedPreferences.getOfferNotification() ?? "";
    if (offerData != "") {
      List<OfferNotifications> list = offerNotificationFromJson(offerData);
      offerNotificationsList.addAll(
        list.where(
          (notifications) => list.every((item) => true),
        ),
      );
      developer.log('log me 267: ${offerNotificationsList.length}',
          name: 'my.app.Notification');
    }
  }

  void initializeOrderList() {
    orderNotificationsList.clear();
    String orderData = UserSharedPreferences.getOrderNotification() ?? "";
    if (orderData != "") {
      List<OrderNotifications> list = orderNotificationFromJson(orderData);
      orderNotificationsList.addAll(
        list.where(
          (notifications) => list.every((item) => true),
        ),
      );
      developer.log('log me 287: ${orderNotificationsList.length}',
          name: 'my.app.Notification');
    }
  }

  void initializeDemandList() {
    demandNotificationsList.clear();
    String demandData = UserSharedPreferences.getDemandNotification() ?? "";
    if (demandData != "") {
      List<DemandNotifications> list = demandNotificationFromJson(demandData);
      demandNotificationsList.addAll(
        list.where(
          (notifications) => list.every((item) => true),
        ),
      );
      developer.log('log me 282: ${demandNotificationsList.length}',
          name: 'my.app.Notification');
    }
  }

  void addAdNotification(AdNotifications adNotifications) {
    adNotificationsList.add(adNotifications);
    UserSharedPreferences.setAdNotification(adNotificationsList);
    update();
  }

  void addOfferNotification(OfferNotifications offerNotifications) {
    offerNotificationsList.add(offerNotifications);
    UserSharedPreferences.setOfferNotification(offerNotificationsList);
    update();
  }

  void addOrderNotification(OrderNotifications orderNotifications) {
    orderNotificationsList.add(orderNotifications);
    UserSharedPreferences.setOrderNotification(orderNotificationsList);
    update();
  }

  void addDemandNotification(DemandNotifications demandNotifications) {
    demandNotificationsList.add(demandNotifications);
    UserSharedPreferences.setDemandNotification(demandNotificationsList);
    update();
  }

  get offers => offerNotificationsList.reversed.toList();

  get ads => adNotificationsList.reversed.toList();

  get orders => orderNotificationsList.reversed.toList();

  get demands => demandNotificationsList.reversed.toList();

  // customerSupport() {
  //   customerSupportList.addAll(orderNotificationsList
  //       .where((item) => orderNotificationsList.every((element) => true)));
  //   customerSupportList.addAll(demandNotificationsList
  //       .where((item) => demandNotificationsList.every((element) => true)));

  //   return customerSupportList.reversed.toList();
  // }

  // void clearCustomerSupportList() {
  //   customerSupportList.clear();
  //   update();
  // }
}
