import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/screens/complaint/complaint_screen.dart';
import 'package:fyp_frontend/screens/demand/demand_screen.dart';
import 'package:fyp_frontend/screens/payment/payment_profile_screen.dart';

import '../../../constants.dart';
import '../../../models/login_response_model.dart';
import '../../orders/orders_screen.dart';
import '../../toShopList/toShop_screen.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({Key? key, required this.userDetails}) : super(key: key);

  final LoginResponseModel userDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 80,
              width: 100,
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
                boxShadow: myBoxShadow,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrdersScreen(
                          userId: userDetails.data.id,
                        ),
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.cube_fill,
                      color: primaryColor,
                    ),
                    Text(
                      "Orders",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              width: 100,
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
                boxShadow: myBoxShadow,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ToShopScreen(),
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.list,
                      color: primaryColor,
                    ),
                    Text(
                      "To-Shop",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              width: 100,
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
                boxShadow: myBoxShadow,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentProfileScreen(
                          userDetails: userDetails,
                        ),
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.paypal_rounded,
                      color: primaryColor,
                    ),
                    Text(
                      "Payment",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 80,
              width: 130,
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
                boxShadow: myBoxShadow,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddComplaintScreen(
                          userId: userDetails.data.id,
                        ),
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.feedback_outlined,
                      color: primaryColor,
                    ),
                    Text(
                      "Add Complaint",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              width: 100,
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
                boxShadow: myBoxShadow,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DemandsScreen(
                          userId: userDetails.data.id,
                        ),
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.hail_outlined,
                      color: primaryColor,
                    ),
                    Text(
                      "Demands",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
