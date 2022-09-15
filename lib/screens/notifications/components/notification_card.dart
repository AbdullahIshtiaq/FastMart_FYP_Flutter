import 'package:flutter/material.dart';
import 'package:fyp_frontend/models/Notification.dart';

import '../../../constants.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.notification,
    required this.press,
  }) : super(key: key);

  final Notifications notification;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        boxShadow: myBoxShadow,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.local_offer,
                color: primaryColor,
                size: 30,
              ),
            ],
          ),
          const SizedBox(width: defaultPadding),
          Expanded(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.notificationTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  notification.notificationDateTime,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  notification.notificationDescription,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
