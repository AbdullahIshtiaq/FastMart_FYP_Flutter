import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/screens/checkout/components/billing_info.dart';
import 'package:fyp_frontend/screens/payment/payment_successful_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../models/Cart.dart';
import '../../models/order_request_model.dart';
import '../../services/api_service.dart';
import '../../services/shared_service.dart';
import '../../utils/shared_preferences.dart';

class CashScreen extends StatefulWidget {
  const CashScreen({super.key});

  @override
  State<CashScreen> createState() => _CashScreenState();
}

class _CashScreenState extends State<CashScreen> {
  CartController cartController = Get.put(CartController());

  bool isProcessing = false;
  String? orderId;
  bool isLoading = true;
  late int orderNo;
  late String formattedDate;

  int getTotalWithTax() {
    int result = cartController.grandTotal;
    return (result + (result * 0.07)).toInt();
  }

  updatePaymentStatus() async {
    UserSharedPreferences.deleteCartList();
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isProcessing = false;
    });

    // ignore: use_build_context_synchronously
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => PaymentSuccessfulScreen(
                cartController: cartController,
                order: {"orderNo": orderNo, "orderDate": formattedDate})),
        (Route<dynamic> route) => false);
  }

  saveOrder(BuildContext context) async {
    print("In Cash Payment : Start");

    orderNo = DateTime.now().millisecondsSinceEpoch;
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
    formattedDate = formatter.format(now);

    int total = getTotalWithTax();

    OrderRequestModel model = OrderRequestModel(
        orderNo: orderNo.toString(),
        orderUser: userDetails!.data.id,
        orderProducts: orderProducts,
        paymentMethod: "Cash",
        orderDate: formattedDate,
        quantity: totalQty,
        orderDiscount: cartController.discount,
        total: total);

    print("In Cash Payment : Calling API");

    bool isResponse =
        await APIService.orderByCash(model).then((response) async {
      if (response == null) {
        print("In Cash : Failed");
        orderId = null;
        return false;
      } else {
        print("In Cash Details 82: Response ${response}");
        orderId = response;
        return true;
      }
    });

    if (!isResponse) {
      Get.snackbar("Order Failed", "Please try again later",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
      setState(() {
        isLoading = false;
      });
      return;
    } else {
      Get.snackbar("Order Saved", "Please pay on POS counter",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      setState(() {
        isLoading = false;
        isProcessing = true;
      });
    }
  }

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message in the foreground! In Cash Payment');
      //storeNotifications(json.encode(message.data));
      if (message.data['notificationType'] == 'Order') {
        if (message.data['paymentMethod'] == "Cash") {
          updatePaymentStatus();
        }
      }
    });

    saveOrder(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(
            "Cash Payment",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: (isLoading)
              ? const Center(
                  child: SizedBox(
                    height: 80.0,
                    width: 80.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 4.0,
                      valueColor: AlwaysStoppedAnimation(primaryColor),
                    ),
                  ),
                )
              : Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: defaultPadding),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                            Radius.circular(defaultBorderRadius)),
                      ),
                      height: 200,
                      child: SfBarcodeGenerator(
                        textSpacing: 10,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        value: orderId,
                        symbology: Code128A(),
                        showValue: true,
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    BillingInfo(cartController: cartController),
                    const SizedBox(height: defaultPadding * 2),
                    isProcessing
                        ? Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 80.0,
                                  width: 80.0,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 4.0,
                                    valueColor:
                                        AlwaysStoppedAnimation(primaryColor),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Wait for a moment..."),
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
        ));
  }
}
