import 'package:flutter/material.dart';
import 'package:fyp_frontend/models/Notification.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class OfferNotificationCard extends StatelessWidget {
  const OfferNotificationCard({
    Key? key,
    required this.notification,
    required this.press,
  }) : super(key: key);

  final OfferNotifications notification;
  final VoidCallback press;

  calcuateTime() {
    var dateTime = DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(notification.notificationDateTime);
    DateTime currentDateTime = DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()));

    var differenceInSce =
        (dateTime.difference(currentDateTime).inSeconds).abs();

    if (differenceInSce < 60) {
      return "$differenceInSce seconds ago";
    } else if (differenceInSce < 3600) {
      return "${differenceInSce ~/ 60} minutes ago";
    } else if (differenceInSce < 86400) {
      return "${differenceInSce ~/ 3600} hours ago";
    } else if (differenceInSce < 604800) {
      return "${differenceInSce ~/ 86400} days ago";
    } else if (differenceInSce < 2592000) {
      return "${differenceInSce ~/ 604800} weeks ago";
    } else if (differenceInSce < 31104000) {
      return "${differenceInSce ~/ 2592000} months ago";
    } else {
      return "${differenceInSce ~/ 31104000} years ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(defaultPadding / 2, defaultPadding,
          defaultPadding / 2, defaultPadding / 2),
      decoration: const BoxDecoration(
        color: Colors.white,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.notificationTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: defaultPadding / 4),
                Text(
                  '${calcuateTime()}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  'Discount: ${notification.notificationDiscount}%',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: defaultPadding / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'From: ${notification.notificationStartDate}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Till: ${notification.notificationEndDate}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding / 2),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(defaultBorderRadius)),
                      boxShadow: myBoxShadow,
                    ),
                    child: Text(
                      notification.notificationDescription,
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
