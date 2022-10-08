import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/models/Notification.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/MyPagination.dart';
import 'package:fyp_frontend/models/OrderFilterModel.dart';
import 'package:fyp_frontend/models/order_request_model.dart';
import 'package:fyp_frontend/providers/myProvider.dart';
import 'package:fyp_frontend/screens/checkout/components/billing_info.dart';
import 'package:fyp_frontend/screens/payment/payment_successful_screen.dart';
import 'package:fyp_frontend/services/api_service.dart';
import 'package:fyp_frontend/services/shared_service.dart';
import 'package:fyp_frontend/utils/shared_preferences.dart';
import '../../models/Cart.dart';
import 'components/checkout_items_list.dart';
import 'components/credit_card_details.dart';
import 'components/payment_methods.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // @override
  bool isClicked = false;

  bool isCard = false;

  bool isCash = false;

  CartController cartController = Get.put(CartController());

  NotificationController notificationController =
      Get.put(NotificationController());

  // onProceedClick(BuildContext context, WidgetRef ref) async {
  //   int orderNo = DateTime.now().millisecondsSinceEpoch;
  //   var userDetails = await SharedService.loginDetails();
  //   String orderProducts = "";

  //   int totalQty = 0;
  //   for (var p in cartController.cartProducts) {
  //     p = p as CartProduct;

  //     for (int i = 0; i < p.qty; i++) {
  //       orderProducts += p.productId + ":";
  //       totalQty++;
  //     }
  //   }
  //   var now = DateTime.now();
  //   var formatter = DateFormat('yyyy-MM-dd');
  //   String formattedDate = formatter.format(now);

  //   int total = getTotalWithTax().toInt();

  //   OrderRequestModel model = OrderRequestModel(
  //       orderNo: orderNo.toString(),
  //       orderUser: userDetails!.data.id,
  //       orderProducts: orderProducts,
  //       paymentMethod: "Cash",
  //       orderDate: formattedDate,
  //       quantity: totalQty,
  //       total: total);

  //   bool isResponse = await APIService.saveOrder(model).then((response) {
  //     if (!response) {
  //       Get.snackbar("Order Failed", "",
  //           snackPosition: SnackPosition.BOTTOM,
  //           duration: const Duration(seconds: 1));
  //     } else {
  //       OrderFilterModel filterModel = OrderFilterModel(
  //           paginationModel: MyPaginationModel(page: 1, pageSize: 10),
  //           userId: userDetails.data.id);
  //       ref.read(ordersFilterProvider.notifier).setOrderFilter(filterModel);
  //       ref.read(ordersNotifierProvider.notifier).getOrders();

  //       Get.snackbar("Order Successful", "",
  //           snackPosition: SnackPosition.BOTTOM,
  //           duration: const Duration(seconds: 1));
  //     }
  //     return response;
  //   });

  //   if (!isResponse) {
  //     return;
  //   } else {
  //     UserSharedPreferences.deleteCartList();

  //     int notificationId = DateTime.now().millisecondsSinceEpoch;

  //     notificationController.addNotification(Notifications(
  //         notificationId: notificationId.toString(),
  //         notificationTitle: "Order Successful",
  //         notificationDescription:
  //             "Your order has been placed successfully. Payment received is $total.",
  //         notificationDateTime: formattedDate,
  //         notificationType: "App",
  //         isRead: false));

  //     UserSharedPreferences.setNotification(
  //         notificationController.notifications);

  //     await Future.delayed(const Duration(seconds: 1));

  //     // ignore: use_build_context_synchronously
  //     await Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //             builder: (BuildContext context) => PaymentSuccessfulScreen(
  //                   cartController: cartController,
  //                 )),
  //         (Route<dynamic> route) => false);
  //   }
  // }

  // double getTotalWithTax() {
  //   double result = double.parse(cartController.total);
  //   return (result + (result * 0.07));
  // }

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
            BillingInfo(
              cartController: cartController,
            ),
            const SizedBox(height: defaultPadding * 2),
            Text(
              "Payment Methods",
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                          Icons.currency_rupee_rounded,
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
            //const SizedBox(height: defaultPadding * 18),
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
                        print(isClicked);
                        //onProceedClick(context, ref);
                        if (isCard) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CreditCardDetailsScreen(),
                              )).then((value) => isClicked = false);
                        } else if (isCash) {
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
