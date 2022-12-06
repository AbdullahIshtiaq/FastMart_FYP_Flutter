import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/screens/notifications/components/ad_notification_card.dart';
import 'package:get/get.dart';
import '../../models/Notification.dart';
import '../../utils/my_text.dart';
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

  late List notifications = [];

  @override
  void initState() {
    super.initState();
    notifications = notificationController.ads;
  }

  @override
  Widget build(BuildContext context) {
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
                      notifications = notificationController.ads;
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
                      notifications = notificationController.offers;
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
                      notifications = notificationController.orders;
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.cube_fill,
                    color: primaryColor,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      notifications = notificationController.demands;
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
                            ? 1.7
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
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.notifications,
                                size: 100, color: Colors.grey[300]),
                            Container(height: 15),
                            Text("No Notifications",
                                style: MyText.title(context)!.copyWith(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
