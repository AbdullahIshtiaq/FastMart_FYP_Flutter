import 'dart:convert';

import 'package:get/get.dart';
import 'dart:developer' as developer;

import '../utils/shared_preferences.dart';

List<Notifications> notificationFromJson(String str) =>
    List<Notifications>.from(
        json.decode(str).map((x) => Notifications.fromJson(x)));

class Notifications {
  Notifications({
    required this.notificationId,
    required this.notificationTitle,
    required this.notificationDescription,
    required this.notificationDateTime,
    required this.notificationType,
    required this.isRead,
  });

  late final String notificationId;
  late final String notificationTitle;
  late final String notificationDescription;
  late final String notificationDateTime;
  late final String notificationType;
  late final bool isRead;

  Notifications.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    notificationTitle = json['notificationTitle'];
    notificationDescription = json['notificationDescription'];
    notificationDateTime = json['notificationDateTime'];
    notificationType = json['notificationType'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['notificationId'] = notificationId;
    _data['notificationTitle'] = notificationTitle;
    _data['notificationDescription'] = notificationDescription;
    _data['notificationDateTime'] = notificationDateTime;
    _data['notificationType'] = notificationType;
    _data['isRead'] = isRead;
    return _data;
  }
}

class NotificationController extends GetxController {
  var notificationsList = [].obs;

  @override
  void onInit() {
    String str = UserSharedPreferences.getNotification() ?? "";
    if (str != "") {
      List<Notifications> list = notificationFromJson(str);

      notificationsList.clear();
      notificationsList.addAll(
        list.where(
          (notifications) => list.every((item) => true),
        ),
      );
      developer.log('log me 64: ${notificationsList.length}',
          name: 'my.app.Notification');
    }
    super.onInit();
  }

  void addNotification(Notifications notification) {
    notificationsList.add(notification);
    update();
  }

  get notifications => notificationsList;

  get promotionsNotifications => notificationsList
      .where((notification) => notification.notificationType == "Promotion")
      .toList();

  get customerSupportNotifications => notificationsList
      .where(
          (notification) => notification.notificationType == "CustomerSupport")
      .toList();

  get appNotifications => notificationsList
      .where((notification) => notification.notificationType == "App")
      .toList();

  void removeNotification(Notifications notification) {
    notificationsList.removeWhere(
        (element) => element.notificationId == notification.notificationId);
    update();
  }
}
