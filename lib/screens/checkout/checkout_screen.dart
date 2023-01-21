import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/screens/checkout/card_selection.dart';
import 'package:fyp_frontend/screens/payment/cash_payment_screen.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:intl/intl.dart';
import '../../models/Cart.dart';
import 'components/billing_info.dart';
import 'components/checkout_items_list.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isClicked = false;

  bool isCard = false;

  bool isCash = false;

  bool isDiscountDone = false;

  var format;

  CartController cartController = Get.put(CartController());

  void isDiscount() async {
    isDiscountDone = await cartController.calculateOffers();
    setState(() {
      isDiscountDone = isDiscountDone;
    });
  }

  @override
  void initState() {
    super.initState();
    isDiscount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(defaultPadding * 2,
            defaultPadding / 2, defaultPadding * 2, defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Items",
              style: Theme.of(context).textTheme.headline6,
            ),
            CheckoutItemsList(
              cartController: cartController,
            ),
            const SizedBox(height: defaultPadding * 2),
            Text(
              "Billing Information",
              style: Theme.of(context).textTheme.headline6,
            ),
            (isDiscountDone)
                ? BillingInfo(
                    cartController: cartController,
                  )
                : const Center(child: CircularProgressIndicator()),
            const SizedBox(height: defaultPadding * 2),
            Text(
              "Payment Methods",
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ////// Card Payment
                Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          isCard = !isCard;
                          isCash = false;
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(defaultBorderRadius)),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -60,
                      left: 0,
                      top: -5,
                      child: IconButton(
                        icon: Icon(
                          isCard
                              ? CupertinoIcons.check_mark_circled_solid
                              : CupertinoIcons.check_mark_circled,
                          color: Colors.green,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            isCard = !isCard;
                            isCash = false;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 30,
                      child: IconButton(
                        icon: const Icon(
                          CupertinoIcons.creditcard,
                          color: primaryColor,
                          size: 50,
                        ),
                        onPressed: () {
                          setState(() {
                            isCard = !isCard;
                            isCash = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                ////// Cash Payment
                Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    InkWell(
                      onTap: () => setState(() {
                        isCash = !isCash;
                        isCard = false;
                      }),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(defaultBorderRadius)),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -60,
                      left: 0,
                      top: -5,
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
                            isCard = false;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 30,
                      child: IconButton(
                        icon: const Icon(
                          Icons.money,
                          color: primaryColor,
                          size: 50,
                        ),
                        onPressed: () {
                          setState(() {
                            isCash = !isCash;
                            isCard = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: defaultPadding),
                child: Material(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    onTap: () {
                      if (!isClicked) {
                        isClicked = true;
                        if (isCard) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CardSelectionScreen(),
                              )).then((value) => isClicked = false);
                        } else if (isCash) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CashScreen(),
                              )).then((value) => isClicked = false);
                        } else {
                          isClicked = false;
                          Get.snackbar("Please selest payment option.", "",
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 1));
                        }
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      child: Text(
                        "Proceed",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
