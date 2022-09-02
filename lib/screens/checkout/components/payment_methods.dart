import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'credit_card_details.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  bool isCredit = false;
  bool isCash = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
            ),
            Positioned(
              child: IconButton(
                icon: Icon(
                  isCredit
                      ? CupertinoIcons.check_mark_circled_solid
                      : CupertinoIcons.check_mark_circled,
                  color: Colors.green,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    isCredit = !isCredit;
                    isCash = !isCash;
                  });
                },
              ),
              right: -60,
              left: 0,
              top: -5,
            ),
            Positioned(
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.creditcard,
                  color: primaryColor,
                  size: 50,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreditCardDetailsScreen(),
                      ));
                },
              ),
              right: 0,
              left: 0,
              bottom: 30,
            ),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
            ),
            Positioned(
              child: IconButton(
                icon: Icon(
                  isCash
                      ? CupertinoIcons.check_mark_circled_solid
                      : CupertinoIcons.check_mark_circled,
                  color: Colors.green,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    isCash = !isCash;
                    isCredit = !isCredit;
                  });
                },
              ),
              right: -60,
              left: 0,
              top: -5,
            ),
            Positioned(
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.money_dollar_circle,
                  color: primaryColor,
                  size: 50,
                ),
                onPressed: () {

                },
              ),
              right: 0,
              left: 0,
              bottom: 30,
            ),
          ],
        ),
      ],
    );
  }
}
