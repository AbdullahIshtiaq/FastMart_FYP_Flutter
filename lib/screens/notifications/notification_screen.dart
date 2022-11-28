import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/screens/notifications/components/ad_notification_card.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/Notification.dart';
import '../../utils/shared_preferences.dart';
import 'components/demand_notification_card.dart';
import 'components/offer_notification_card.dart';
import 'components/order_notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationController notificationController =
      Get.put(NotificationController());
  late var data;

  bool showAds = true;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final args = ModalRoute.of(context)!.settings.arguments;

  //   if (args != null) {
  //     Map? pushNotification = args as Map;
  //     setState(() {
  //       data = json.decode(pushNotification['message']);
  //       print("Line 30: ${data['notificationType']}");
  //       var date = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());

  //       if (data['notificationType'] == "Demand") {
  //         DemandNotifications obj = DemandNotifications(
  //             notificationDemandId: data['demandId'],
  //             notificationMessage: data['message'],
  //             notificationResponse: data['response'],
  //             notificationType: data['notificationType'],
  //             notificationDemandProgress: data['demandProgress'],
  //             notificationDateTime: date,
  //             notificationDemandCreatedDateTime: data['createdDateTime'],
  //             isRead: true);

  //         setState(() {
  //           notificationController.addDemandNotification(obj);
  //           notifications = notificationController.customerSupportList;
  //           print("Line 49: ${notifications.length}");
  //         });
  //       } else if (data['notificationType'] == "Ad") {
  //         AdNotifications obj = AdNotifications(
  //             notificationTitle: data['advertismentTitle'],
  //             notificationDescription: data['advertismentDesc'],
  //             notificationCreatedDateTime: data['createdDateTime'],
  //             notificationAdType: data['advertismentType'],
  //             notificationImage: data['advertismentAttachment'],
  //             notificationType: data['notificationType'],
  //             notificationDateTime: date,
  //             isRead: true);

  //         setState(() {
  //           notificationController.addAdNotification(obj);
  //           notifications = notificationController.ads;
  //           print("Line 65: ${notifications.length}");
  //         });
  //       } else if (data['notificationType'] == "Order") {
  //         OrderNotifications obj = OrderNotifications(
  //             notificationOrderNo: data['orderNo'],
  //             notificationOrderDate: data['orderDate'],
  //             notificationOrderTime: data['orderTime'],
  //             notificationTotal: data['orderTotal'],
  //             notificationMessage: data['message'],
  //             notificationType: data['notificationType'],
  //             notificationDateTime: date,
  //             isRead: true);

  //         setState(() {
  //           notificationController.addOrderNotification(obj);
  //           notifications = notificationController.customerSupportList;
  //           print("Line 81: ${notifications.length}");
  //         });
  //       } else if (data['notificationType'] == "Offer") {
  //         OfferNotifications obj = OfferNotifications(
  //             notificationTitle: data['advertismentTitle'],
  //             notificationDescription: data['advertismentDesc'],
  //             notificationCreatedDateTime: data['createdDateTime'],
  //             notificationAdType: data['advertismentType'],
  //             notificationStartDate: data['startDate'],
  //             notificationEndDate: data['endDate'],
  //             notificationDiscount: data['discount'],
  //             notificationCategoryName: data['categoryName'],
  //             notificationType: data['notificationType'],
  //             notificationDateTime: date,
  //             isRead: true);

  //         setState(() {
  //           notificationController.addOfferNotification(obj);
  //           notifications = notificationController.offers;
  //           print("Line 100: ${notifications.length}");
  //         });
  //       }
  //     });
  //   }
  // }

  late List notifications = [];

  @override
  void initState() {
    super.initState();
    notificationController.clearCustomerSupportList();
    notifications = notificationController.ads;

    // print(
    //     "Line 123 Length: ${notificationController.orderNotificationsList.length}");
    // print(
    //     "Line 126 Length: ${notificationController.demandNotificationsList.length}");
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding, 0.0, defaultPadding, defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      showAds = true;
                      notifications = notificationController.ads;
                      print("Line 151: ${notifications.length}");
                    });
                  },
                  child: const Icon(
                    FontAwesomeIcons.rectangleAd,
                    color: primaryColor,
                    size: 45,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      showAds = false;
                      notifications = notificationController.offers;
                      print("Line 165: ${notifications.length}");
                    });
                  },
                  child: const Icon(
                    Icons.local_offer,
                    color: primaryColor,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      showAds = false;
                      notificationController.clearCustomerSupportList();
                      notifications = notificationController.customerSupport();
                      print("Line 181: ${notifications.length}");
                    });
                  },
                  child: const Icon(
                    Icons.quickreply,
                    color: primaryColor,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: (notifications.isNotEmpty)
                  ? GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: (notifications[0].notificationType ==
                                    "Demand" ||
                                notifications[0].notificationType == "Order")
                            ? 1.5
                            : (notifications[0].notificationType == "Offer")
                                ? 1.7
                                : 1.5,
                      ),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(defaultPadding / 2),
                        child: (notifications[index].notificationType == "Ad")
                            ? AdNotificationCard(
                                notification:
                                    notifications[index] as AdNotifications,
                                press: () {},
                              )
                            : (notifications[index].notificationType ==
                                    "Demand")
                                ? DemandNotificationCard(
                                    notification: notifications[index]
                                        as DemandNotifications,
                                    press: () {},
                                  )
                                : (notifications[index].notificationType ==
                                        "Order")
                                    ? OrderNotificationCard(
                                        notification: notifications[index]
                                            as OrderNotifications,
                                        press: () {},
                                      )
                                    : (notifications[index].notificationType ==
                                            "Offer")
                                        ? OfferNotificationCard(
                                            notification: notifications[index]
                                                as OfferNotifications,
                                            press: () {},
                                          )
                                        : Container(),
                      ),
                      itemCount: notifications.length,
                      scrollDirection: Axis.vertical,
                    )
                  : Center(
                      child: Text(
                        "No Notifications",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
