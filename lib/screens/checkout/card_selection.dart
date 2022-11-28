import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/OrderPayment.dart';
import 'package:fyp_frontend/models/login_response_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../models/Cart.dart';
import '../../models/order_request_model.dart';
import '../../services/api_service.dart';
import '../../services/shared_service.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_text.dart';
import '../../utils/shared_preferences.dart';
import '../payment/credit_card_details.dart';
import '../payment/payment_successful_screen.dart';
import 'components/billing_info.dart';

class CardSelectionScreen extends StatefulWidget {
  const CardSelectionScreen({Key? key}) : super(key: key);

  @override
  State<CardSelectionScreen> createState() => _CardSelectionScreenState();
}

class _CardSelectionScreenState extends State<CardSelectionScreen> {
  bool isloading = false;
  int selectedCard = 0;

  CartController cartController = Get.put(CartController());

  int getTotalWithTax() {
    int result = cartController.grandTotal;
    return (result + (result * 0.07)).toInt();
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

    int total = getTotalWithTax();
    print("Line 54 in Card Selection : $total");

    var cardDetails = {
      "card_Name": cardsList[selectedCard].cardName,
      "card_Number": cardsList[selectedCard].cardNumber,
      "card_ExpMonth": cardsList[selectedCard].cardExpMonth,
      "card_ExpYear": cardsList[selectedCard].cardExpYear,
      "card_CVC": cardsList[selectedCard].cardCVC,
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
              paymentMethodId: orderPayment.cardId,
            )));

        print("In Card Details 98 : stripeResponse ${stripeResponse.status}");

        if (stripeResponse.status == PaymentIntentsStatus.Succeeded) {
          var response = await APIService.updateOrder(
              orderPayment.orderId, stripeResponse.id);

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

      // ignore: use_build_context_synchronously
      await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PaymentSuccessfulScreen(
                    cartController: cartController,
                  )),
          (Route<dynamic> route) => false);
    }
  }

  late List<Card> cardsList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCards(context);
  }

  isAnySelected() {
    for (var card in cardsList) {
      if (card.isSelected) {
        return true;
      }
    }
    return false;
  }

  getCards(BuildContext context) async {
    LoginResponseModel? userDetails = await SharedService.loginDetails();

    await APIService.getCards(userDetails!.data.id.toString())
        .then((response) async {
      if (response == null) {
        print("No Card Found : Failed");
        cardsList = [];
        setState(() {
          isLoading = false;
        });
        return false;
      } else {
        cardsList = [];
        for (var card in response) {
          cardsList.add(Card(
            cardId: card.cardId,
            cardName: card.cardName,
            cardNumber: card.cardNumber,
            cardExpYear: card.cardExpYear,
            cardExpMonth: card.cardExpMonth,
            cardCVC: card.cardCVC,
            isSelected: false,
          ));
        }
        //print("Cards Found : Success $cardsList");
        setState(() {
          isLoading = false;
        });
        return true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(
            "Select Card",
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.add,
                size: 35,
              ),
              color: primaryColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreditCardDetailsScreen(
                        fromScreen: "CardSelectionScreen",
                      ),
                    ));
              },
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 250,
              child: (isLoading)
                  ? const Center(child: CircularProgressIndicator())
                  : (cardsList.isNotEmpty)
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              height: 230,
                              width: 320,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            defaultBorderRadius * 2),
                                        topRight: Radius.circular(
                                            defaultBorderRadius * 2),
                                        bottomLeft: Radius.circular(
                                            defaultBorderRadius * 2),
                                        bottomRight: Radius.circular(
                                            defaultBorderRadius * 2),
                                      ),
                                      boxShadow: myBoxShadow),
                                  margin: const EdgeInsets.all(0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      Image.asset('assets/images/world_map.png',
                                          fit: BoxFit.cover),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            int i = 0;
                                            for (var card in cardsList) {
                                              if (i == index) {
                                                cardsList[index].isSelected =
                                                    !cardsList[index]
                                                        .isSelected;
                                                selectedCard = index;
                                              } else {
                                                card.isSelected = false;
                                              }

                                              i++;
                                            }
                                          });
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.all(20),
                                            alignment: Alignment.topLeft,
                                            width: 50,
                                            height: 50,
                                            child: (cardsList[index].isSelected)
                                                ? const Icon(
                                                    CupertinoIcons
                                                        .checkmark_circle_fill,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    CupertinoIcons
                                                        .checkmark_circle,
                                                    color: Colors.white)),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(20),
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                            'assets/images/ic_copper_card.png',
                                            width: 60,
                                            height: 60),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                const Spacer(),
                                                Image.asset(
                                                    'assets/images/ic_visa.png',
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
                                            Text(cardsList[index].cardNumber,
                                                style: MyText.headline(context)!
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "monospace")),
                                            Container(height: 10),
                                            Row(
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text("EXPIRE",
                                                        style: MyText.body1(
                                                                context)!
                                                            .copyWith(
                                                                color: MyColors
                                                                    .grey_10)),
                                                    Container(height: 5),
                                                    Text(
                                                        "${cardsList[index].cardExpMonth}/${cardsList[index].cardExpYear}",
                                                        style: MyText.subhead(
                                                                context)!
                                                            .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    "monospace")),
                                                  ],
                                                ),
                                                Container(width: 20),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text("CVV",
                                                        style: MyText.body1(
                                                                context)!
                                                            .copyWith(
                                                                color: MyColors
                                                                    .grey_10)),
                                                    Container(height: 5),
                                                    Text(
                                                        cardsList[index]
                                                            .cardCVC,
                                                        style: MyText.subhead(
                                                                context)!
                                                            .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    "monospace")),
                                                  ],
                                                ),
                                                Container(width: 40)
                                              ],
                                            ),
                                            Container(height: 25),
                                            Text(cardsList[index].cardName,
                                                style: MyText.subhead(context)!
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "monospace")),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          itemCount: cardsList.length,
                        )
                      : const Center(
                          child: Text("No Cards Found"),
                        ),
            ),
            const SizedBox(
              height: 20,
            ),
            BillingInfo(
              cartController: cartController,
            ),
            Container(height: 25),
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (!isAnySelected()) {
                      Get.snackbar(
                        "Please select the card",
                        "",
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 1),
                      );
                    } else {
                      if (!isloading) {
                        setState(() {
                          isloading = true;
                        });
                        onPayClick(context);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: const StadiumBorder()),
                  child: const Text("Pay Now",
                      style: TextStyle(color: Colors.white)),
                ),
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

class Card {
  String cardId;
  String cardNumber;
  String cardName;
  String cardExpYear;
  String cardExpMonth;
  String cardCVC;
  bool isSelected;

  Card({
    required this.cardId,
    required this.cardNumber,
    required this.cardName,
    required this.cardExpYear,
    required this.cardExpMonth,
    required this.cardCVC,
    this.isSelected = false,
  });
}
