import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/models/Notification.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class OrderNotificationCard extends StatelessWidget {
  const OrderNotificationCard({
    Key? key,
    required this.notification,
    required this.press,
  }) : super(key: key);

  final OrderNotifications notification;
  final VoidCallback press;

  calcuateTime() {
    var dateTime = DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(notification.notificationDateTime);
    // print(dateTime);
    DateTime currentDateTime = DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()));

    var differenceInSce =
        (dateTime.difference(currentDateTime).inSeconds).abs();
    // print(differenceInSce);

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
                CupertinoIcons.cube_fill,
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
                  'Order No: ${notification.notificationOrderNo}',
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  'Total Bill Paid: ${notification.notificationTotal}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  'Date: ${notification.notificationOrderDate}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  'Time: ${notification.notificationOrderTime}',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: defaultPadding / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Message',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: Text(
                        '${calcuateTime()}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
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
                      notification.notificationMessage,
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
