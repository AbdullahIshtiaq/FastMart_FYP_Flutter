import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_text.dart';

class CreditCardDetailsScreen extends StatefulWidget {
  const CreditCardDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardDetailsScreen> createState() =>
      _CreditCardDetailsScreenState();
}

class _CreditCardDetailsScreenState extends State<CreditCardDetailsScreen> {
  String cardNo = "**** **** **** ****";
  String cardExpire = "MM/YY";
  String cardCvv = "***";
  String cardName = "Your Name";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Credit Card",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(height: 5),
            SizedBox(
              height: 240,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: primaryColor,
                  elevation: 2,
                  margin: const EdgeInsets.all(0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset('assets/images/world_map.png',
                          fit: BoxFit.cover),
                      Container(
                        margin: const EdgeInsets.all(20),
                        alignment: Alignment.bottomRight,
                        child: Image.asset('assets/images/ic_copper_card.png',
                            width: 60, height: 60),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Spacer(),
                                Image.asset('assets/images/ic_visa.png',
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 30),
                              ],
                            ),
                            Container(height: 10),
                            Text(cardNo,
                                style: MyText.headline(context)!.copyWith(
                                    color: Colors.white,
                                    fontFamily: "monospace")),
                            Container(height: 10),
                            Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("EXPIRE",
                                        style: MyText.body1(context)!
                                            .copyWith(color: MyColors.grey_10)),
                                    Container(height: 5),
                                    Text(cardExpire,
                                        style: MyText.subhead(context)!
                                            .copyWith(
                                                color: Colors.white,
                                                fontFamily: "monospace")),
                                  ],
                                ),
                                Container(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("CVV",
                                        style: MyText.body1(context)!
                                            .copyWith(color: MyColors.grey_10)),
                                    Container(height: 5),
                                    Text(cardCvv,
                                        style: MyText.subhead(context)!
                                            .copyWith(
                                                color: Colors.white,
                                                fontFamily: "monospace")),
                                  ],
                                ),
                                Container(width: 40)
                              ],
                            ),
                            Container(height: 25),
                            Text(cardName,
                                style: MyText.subhead(context)!.copyWith(
                                    color: Colors.white,
                                    fontFamily: "monospace")),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    maxLines: 1,
                    maxLength: 19,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Credit card number", counterText: ''),
                    onChanged: (val) {
                      setState(() {
                        if (val.length < 2) {
                          cardNo = "**** **** **** ****";
                        } else {
                          //cardNo = Tools.getFormattedCardNo(val);
                        }
                      });
                    },
                  ),
                  Container(height: 15),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          maxLines: 1,
                          maxLength: 5,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              hintText: "MM/YY", counterText: ''),
                          onChanged: (val) {
                            setState(() => cardExpire = val);
                          },
                        ),
                        flex: 1,
                      ),
                      Container(width: 15),
                      Flexible(
                        child: TextField(
                          maxLines: 1,
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: "CVV", counterText: ''),
                          onChanged: (val) {
                            setState(() => cardCvv = val);
                          },
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                  Container(height: 15),
                  TextField(
                    maxLines: 1,
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: "Name on card", counterText: ''),
                    onChanged: (val) {
                      setState(() => cardName = val);
                    },
                  ),
                  Container(height: 25),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // if (cartController.cartProducts.isNotEmpty) {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => const CheckoutScreen(),
                          //       ));
                          // } else {
                          //   Get.snackbar(
                          //     "Cart is Empty",
                          //     "",
                          //     snackPosition: SnackPosition.BOTTOM,
                          //     duration: const Duration(seconds: 1),
                          //   );
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: const StadiumBorder()),
                        child: const Text("Add"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
