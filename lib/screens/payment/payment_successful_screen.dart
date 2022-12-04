import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fyp_frontend/models/MyOrder.dart';
import 'package:fyp_frontend/models/login_response_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/main.dart';
import '../../config.dart';
import '../../models/Cart.dart';
import '../../models/Notification.dart';
import '../../services/shared_service.dart';
import '../pdf/pdf_screen.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  PaymentSuccessfulScreen(
      {Key? key, required this.cartController, required this.order})
      : super(key: key);
  final CartController cartController;
  final MyOrder order;

  @override
  State<PaymentSuccessfulScreen> createState() =>
      _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
  CartController? cartController;
  MyOrder? order;
  LoginResponseModel? userDetails;

  NotificationController notificationController =
      Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    cartController = widget.cartController;
    order = widget.order;
    _clearCartData();
  }

  _clearCartData() async {
    if (order!.paymentMethod == 'Card') {
      var date = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());

      OrderNotifications obj = OrderNotifications(
          notificationOrderNo: order!.orderNo,
          notificationOrderDate: order!.orderDate,
          notificationOrderTime: order!.orderTime,
          notificationTotal: order!.total.toString(),
          notificationOrderPaymentMethod: order!.paymentMethod,
          notificationMessage: "Thank you for shopping with us.",
          notificationType: "Order",
          notificationDateTime: date,
          isRead: true);

      notificationController.addOrderNotification(obj);
      showNotification();
    }

    userDetails = await SharedService.loginDetails();
    print(userDetails);

    // OrderFilterModel filterModel = OrderFilterModel(
    //     paginationModel: MyPaginationModel(page: 1, pageSize: 10),
    //     userId: userDetails!.data.id);
    // ref.read(ordersFilterProvider.notifier).setOrderFilter(filterModel);
    // ref.read(ordersNotifierProvider.notifier).getOrders();

    print("line 79");
  }

  // In App Notification
  showNotification() {
    print("Line 85:");
    flutterLocalNotificationsPlugin.show(
      0,
      'Order Successfully Completed',
      'Thank you for shopping with us.',
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          color: primaryColor,
          playSound: true,
          icon: '@drawable/app_icon',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        cartController!.cartProducts.clear();
        Config.selectedIndex = 0;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const MainScreen(),
            ),
            (Route<dynamic> route) => false);

        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 120),
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Lottie.network(
                        'https://assets9.lottiefiles.com/temp/lf20_q6KowU.json'),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  "Congratulations",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: defaultPadding / 4),
                Text(
                  "Your payment is successful",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: defaultPadding * 2),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      generateInvoice(cartController!, userDetails!, order);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: const StadiumBorder()),
                    child: const Text("Get Your Receipt"),
                  ),
                ),
                const SizedBox(height: defaultPadding * 2),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      cartController!.cartProducts.clear();
                      Config.selectedIndex = 0;
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const MainScreen(),
                          ),
                          (Route<dynamic> route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: lightOrange,
                        shape: const StadiumBorder()),
                    child: const Text(
                      "Go to Home",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
