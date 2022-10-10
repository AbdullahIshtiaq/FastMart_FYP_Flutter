// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/MyCard.dart';
import 'package:fyp_frontend/models/OrderPayment.dart';
import 'package:fyp_frontend/screens/payment/payment_profile_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../models/Cart.dart';
import '../../models/order_request_model.dart';
import '../../services/api_service.dart';
import '../../services/shared_service.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_text.dart';
import '../../utils/shared_preferences.dart';
import 'payment_successful_screen.dart';

class CreditCardDetailsScreen extends StatefulWidget {
  const CreditCardDetailsScreen({Key? key, required this.fromScreen})
      : super(key: key);

  final String fromScreen;

  @override
  State<CreditCardDetailsScreen> createState() =>
      _CreditCardDetailsScreenState();
}

class _CreditCardDetailsScreenState extends State<CreditCardDetailsScreen> {
  String cardNo = "**** **** **** ****";
  String cardExpire = "MM/YY";
  String cardCvv = "***";
  String cardName = "Card Holder Name";

  String inputCardNo = "";
  String inputCardExpire = "";
  String inputCardCvv = "";
  String inputCardName = "";

  bool isloading = false;

  late MyCard myCard;

  CartController cartController = Get.put(CartController());

  onCreateCard(BuildContext context) async {
    var userDetails = await SharedService.loginDetails();

    var cardDetails = {
      "userId": userDetails!.data.id,
      "card_Name": cardName,
      "card_Number": cardNo,
      "card_ExpMonth": cardExpire.split("/")[0],
      "card_ExpYear": cardExpire.split("/")[1],
      "card_CVC": cardCvv,
    };

    print("Line 60 In ADD Card $cardDetails");

    bool isResponse =
        await APIService.createCard(cardDetails).then((response) async {
      if (response == null) {
        print("In Card Details : Failed");
        return false;
      } else {
        myCard = response;
        print("In Card Details 82: Response $response");
        return true;
      }
    });

    if (!isResponse) {
      Get.snackbar("Card Addition Failed. Invalid Details", "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1));
      setState(() {
        isloading = false;
      });
      return;
    } else {
      Get.snackbar("Card Addition Successful", "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1));
      UserSharedPreferences.deleteCartList();

      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        isloading = false;
      });
      Navigator.pop(context, myCard);
    }
  }

  onPayClick(BuildContext context) async {
    print("In Card Details : Start");
    int orderNo = DateTime.now().millisecondsSinceEpoch;
    var userDetails = await SharedService.loginDetails();
    String orderProducts = "";

    int totalQty = 0;
    for (var p in cartController.cartProducts) {
      p = p as CartProduct;

      for (int i = 0; i < p.qty; i++) {
        orderProducts += "${p.productId}:";
        totalQty++;
      }
    }

    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    int total = getTotalWithTax().toInt();

    var cardDetails = {
      "card_Name": cardName,
      "card_Number": cardNo,
      "card_ExpMonth": cardExpire.split("/")[0],
      "card_ExpYear": cardExpire.split("/")[1],
      "card_CVC": cardCvv,
    };

    OrderRequestModel model = OrderRequestModel(
        orderNo: orderNo.toString(),
        orderUser: userDetails!.data.id,
        orderProducts: orderProducts,
        paymentMethod: "Card",
        orderDate: formattedDate,
        quantity: totalQty,
        total: total);

    print("In Card Details : Calling API");

    bool isResponse = await APIService.processPayment(cardDetails, model)
        .then((response) async {
      if (response["data"] == null) {
        print("In Card Details : Failed");
        return false;
      } else {
        print("In Card Details 82: Response ${response["data"]}");

        OrderPayment orderPayment = response["data"] as OrderPayment;

        final stripeResponse = await Stripe.instance.confirmPayment(
            orderPayment.client_secret,
            PaymentMethodParams.cardFromMethodId(
                paymentMethodData: PaymentMethodDataCardFromMethod(
              paymentMethodId: orderPayment.cardID,
            )));

        print("In Card Details 98 : stripeResponse ${stripeResponse.status}");

        if (stripeResponse.status == PaymentIntentsStatus.Succeeded) {
          var response = await APIService.updateOrder(
              orderPayment.orderID, stripeResponse.id);

          if (response!) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      }
    });

    if (!isResponse) {
      Get.snackbar("Order Failed", "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1));
      setState(() {
        isloading = false;
      });
      return;
    } else {
      Get.snackbar("Order Successful", "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1));
      UserSharedPreferences.deleteCartList();

      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        isloading = false;
      });

      await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PaymentSuccessfulScreen(
                    cartController: cartController,
                  )),
          (Route<dynamic> route) => false);
    }
  }

  double getTotalWithTax() {
    double result = double.parse(cartController.total);
    return (result + (result * 0.07));
  }

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
                child: Container(
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(defaultBorderRadius * 2),
                        topRight: Radius.circular(defaultBorderRadius * 2),
                        bottomLeft: Radius.circular(defaultBorderRadius * 2),
                        bottomRight: Radius.circular(defaultBorderRadius * 2),
                      ),
                      boxShadow: myBoxShadow),
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
                                Image.asset(
                                    'assets/images/ic_mastercard_new.png',
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
                    maxLength: 16,
                    enabled: !isloading,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Card number", counterText: ''),
                    onChanged: (val) {
                      setState(() {
                        cardNo = val;
                        inputCardNo = val;
                      });
                    },
                  ),
                  Container(height: 15),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: TextField(
                          maxLines: 1,
                          maxLength: 4,
                          enabled: !isloading,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: "MM/YY", counterText: ''),
                          onChanged: (val) {
                            if (val.length == 4) {
                              val = "${val[0]}${val[1]}/${val[2]}${val[3]}";
                            }
                            setState(() {
                              cardExpire = val;
                              inputCardExpire = val;
                            });
                          },
                        ),
                      ),
                      Container(width: 15),
                      Flexible(
                        flex: 1,
                        child: TextField(
                          maxLines: 1,
                          maxLength: 3,
                          enabled: !isloading,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: "CVV", counterText: ''),
                          onChanged: (val) {
                            setState(() {
                              cardCvv = val;
                              inputCardCvv = val;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Container(height: 15),
                  TextField(
                    maxLines: 1,
                    maxLength: 50,
                    enabled: !isloading,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: "Name on card", counterText: ''),
                    onChanged: (val) {
                      setState(() {
                        cardName = val;
                        inputCardName = val;
                      });
                    },
                  ),
                  Container(height: 25),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (inputCardName.isEmpty ||
                              inputCardNo.isEmpty ||
                              inputCardExpire.isEmpty ||
                              inputCardCvv.isEmpty) {
                            Get.snackbar(
                              "Please fill all fields",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 1),
                            );
                          } else {
                            try {
                              int.parse(inputCardNo);
                            } catch (e) {
                              Get.snackbar(
                                "Please enter valid card number",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );
                              return;
                            }
                            if (inputCardNo.length < 12) {
                              Get.snackbar(
                                "Please enter valid card number",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );
                              return;
                            }

                            if (inputCardExpire.length != 5) {
                              Get.snackbar(
                                "Please enter valid card expiry",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );
                              return;
                            }

                            try {
                              var month = int.parse(
                                  "${inputCardExpire[0]}${inputCardExpire[1]}");

                              if (month > 12 || month < 01) {
                                Get.snackbar(
                                  "Please enter valid card expiry",
                                  "",
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: const Duration(seconds: 1),
                                );
                                return;
                              }
                            } catch (e) {
                              Get.snackbar(
                                "Please enter valid card expiry",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );
                              return;
                            }

                            try {
                              var now = DateTime.now();
                              var formatter = DateFormat('yyyy');
                              var currentYear = int.parse(
                                  "${formatter.format(now)[2]}${formatter.format(now)[3]}");

                              var year = int.parse(
                                  "${inputCardExpire[3]}${inputCardExpire[4]}");

                              if (currentYear > year) {
                                Get.snackbar(
                                  "Please enter valid card expiry",
                                  "",
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: const Duration(seconds: 1),
                                );
                                return;
                              }
                            } catch (e) {
                              Get.snackbar(
                                "Please enter valid card expiry",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );
                              return;
                            }

                            if (inputCardCvv.length != 3) {
                              Get.snackbar(
                                "Please enter valid card CVC",
                                "",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );
                              return;
                            }

                            if (!isloading) {
                              setState(() {
                                isloading = true;
                              });
                              if (widget.fromScreen == "PaymentProfileScreen") {
                                onCreateCard(context);
                              } else {
                                onPayClick(context);
                              }
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: const StadiumBorder()),
                        child: (widget.fromScreen == "PaymentProfileScreen")
                            ? const Text("Add Card",
                                style: TextStyle(color: Colors.white))
                            : const Text("Pay Now",
                                style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: isloading,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 80.0,
                      width: 80.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 4.0,
                        valueColor: AlwaysStoppedAnimation(primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Wait for a moment..."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
