import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp_frontend/models/Notification.dart';
import 'package:intl/intl.dart';

import '../../../config.dart';
import '../../../constants.dart';

class AdNotificationCard extends StatelessWidget {
  const AdNotificationCard({
    Key? key,
    required this.notification,
    required this.press,
  }) : super(key: key);

  final AdNotifications notification;
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
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        boxShadow: myBoxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.rectangleAd,
                color: primaryColor,
                size: 30,
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    notification.notificationTitle,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    calcuateTime(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          Container(
            //margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius:
                  BorderRadius.all(Radius.circular(defaultBorderRadius)),
              boxShadow: myBoxShadow,
            ),
            child: Image.network(
              (Config.imgURL + notification.notificationImage),
              height: 120,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            notification.notificationDescription,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
