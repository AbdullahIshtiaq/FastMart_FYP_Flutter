import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/screens/notifications/components/notification_card.dart';
import 'package:get/get.dart';

import '../../models/Notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationController notificationController =
      Get.put(NotificationController());

  late List notifications;

  @override
  void initState() {
    super.initState();
    notifications = notificationController.promotionsNotifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding * 2, 0.0, defaultPadding * 2, defaultPadding * 2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      notifications =
                          notificationController.promotionsNotifications;

                      print("Line 46: ${notifications.length}");
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
                      notifications =
                          notificationController.customerSupportNotifications;
                      print("Line 60: ${notifications.length}");
                    });
                  },
                  child: const Icon(
                    Icons.quickreply,
                    color: primaryColor,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    notifications = notificationController.appNotifications;
                    print("Line 72: ${notifications.length}");
                  }),
                  child: const Icon(
                    Icons.account_circle,
                    color: primaryColor,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: (notifications.length != 0)
                  ? GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2.5,
                      ),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding / 2),
                        child: NotificationCard(
                          notification: notifications[index] as Notifications,
                          press: () {},
                        ),
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
