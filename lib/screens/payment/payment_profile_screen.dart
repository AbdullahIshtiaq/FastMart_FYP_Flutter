import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/screens/checkout/components/credit_card_details.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_text.dart';

class PaymentProfileScreen extends StatefulWidget {
  const PaymentProfileScreen({Key? key}) : super(key: key);

  @override
  _PaymentProfileScreenState createState() => _PaymentProfileScreenState();
}

class _PaymentProfileScreenState extends State<PaymentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          elevation: 0,
          backgroundColor: primaryColor,
          title: const Text("Payment"),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreditCardDetailsScreen(),
                    ));
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    width: double.infinity, color: primaryColor, height: 50),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  elevation: 2,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: MyColors.grey_10,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage:
                                AssetImage('assets/images/abdullah.png'),
                          ),
                        ),
                        Container(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Abdullah Ishtiaq",
                                  style: MyText.medium(context).copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold)),
                              Container(height: 2),
                              Text("Rawalpindi, Pakistan",
                                  style: MyText.body1(context)!
                                      .copyWith(color: MyColors.grey_40)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(width: 5),
                      Text("Linked Cards",
                          style: MyText.subhead(context)!.copyWith(
                              color: MyColors.grey_60,
                              fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Text("3 Card(s)",
                          style: MyText.subhead(context)!.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.bold)),
                      Container(width: 5),
                    ],
                  ),
                  Container(height: 10),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    color: Colors.white,
                    elevation: 2,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Primary Card",
                                    style: MyText.medium(context).copyWith(
                                        color: MyColors.grey_80,
                                        fontWeight: FontWeight.bold)),
                                Container(height: 40),
                                Text("Card Number",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("XXXX - XXXX - XXXX - 9867",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                                Container(height: 20),
                                Text("Card Holder Name",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("Abdullah Ishtiaq",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                      'assets/images/ic_mastercard_new.png',
                                      width: 40,
                                      height: 40),
                                ),
                                Container(height: 25),
                                Text("Exp.",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("05 / 24",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                                Container(height: 20),
                                Text("CVV / CVC",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("***",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(height: 5),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    color: Colors.white,
                    elevation: 2,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Secondary Card",
                                    style: MyText.medium(context).copyWith(
                                        color: MyColors.grey_80,
                                        fontWeight: FontWeight.bold)),
                                Container(height: 40),
                                Text("Card Number",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("XXXX - XXXX - XXXX - 6108",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                                Container(height: 20),
                                Text("Card Holder Name",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("Abdullah Ishtiaq",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                      'assets/images/ic_visa.png',
                                      width: 40,
                                      height: 40),
                                ),
                                Container(height: 25),
                                Text("Exp.",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("06 / 25",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                                Container(height: 20),
                                Text("CVV / CVC",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("***",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(height: 5),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    color: Colors.white,
                    elevation: 2,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Additional Card",
                                    style: MyText.medium(context).copyWith(
                                        color: MyColors.grey_80,
                                        fontWeight: FontWeight.bold)),
                                Container(height: 40),
                                Text("Card Number",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("XXXX - XXXX - XXXX - 2356",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                                Container(height: 20),
                                Text("Card Holder Name",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("Abdullah Ishtiaq",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                      'assets/images/ic_visa.png',
                                      width: 40,
                                      height: 40),
                                ),
                                Container(height: 25),
                                Text("Exp.",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("01 / 24",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                                Container(height: 20),
                                Text("CVV / CVC",
                                    style: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                                Container(height: 5),
                                Text("***",
                                    style: MyText.subhead(context)!
                                        .copyWith(color: MyColors.grey_80)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(height: 15),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
