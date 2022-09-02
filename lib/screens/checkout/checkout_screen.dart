import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'components/payment_methods.dart';

// ignore: must_be_immutable
class CheckoutScreen extends ConsumerWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   return _categoryList(ref);
  // }

  bool changeButton = false;

  CartController cartController = Get.put(CartController());

  onProceedClick(BuildContext context, WidgetRef ref) async {
    int orderNo = DateTime.now().millisecondsSinceEpoch;
    var userDetails = await SharedService.loginDetails();
    String orderProducts = "";

    int totalQty = 0;
    for (var p in cartController.cartProducts) {
      p = p as CartProduct;

      for (int i = 0; i < p.qty; i++) {
        orderProducts += p.productId + ":";
        totalQty++;
      }
    }
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    int total = getTotalWithTax().toInt();

    OrderRequestModel model = OrderRequestModel(
        orderNo: orderNo.toString(),
        orderUser: userDetails!.data.id,
        orderProducts: orderProducts,
        paymentMethod: "Cash",
        orderDate: formattedDate,
        quantity: totalQty,
        total: total);

    bool isResponse = await APIService.saveOrder(model).then((response) {
      if (!response) {
        Get.snackbar("Order Failed", "",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 1));
      } else {
        OrderFilterModel filterModel = OrderFilterModel(
            paginationModel: MyPaginationModel(page: 1, pageSize: 10),
            userId: userDetails.data.id);
        ref.read(ordersFilterProvider.notifier).setOrderFilter(filterModel);
        ref.read(ordersNotifierProvider.notifier).getOrders();

        Get.snackbar("Order Successful", "",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 1));
      }
      return response;
    });

    if (!isResponse) {
      return;
    } else {
      UserSharedPreferences.deleteCartList();
      // setState(() {
      //   changeButton = true;
      // });
      await Future.delayed(const Duration(seconds: 1));
      // await Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const PaymentSuccessfulScreen(),
      //     ));
      await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PaymentSuccessfulScreen(
                    cartController: cartController,
                  )),
          (Route<dynamic> route) => false);
      // setState(() {
      //   changeButton = false;
      // });
    }
  }

  double getTotalWithTax() {
    double result = double.parse(cartController.total);
    return (result + (result * 0.07));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            const PaymentMethods(),
            //const SizedBox(height: defaultPadding * 18),
            const Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: defaultPadding),
                child: Material(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 50),
                  child: InkWell(
                    onTap: () => onProceedClick(context, ref),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 50,
                      width: changeButton ? 50 : 200,
                      alignment: Alignment.center,
                      child: changeButton
                          ? const Icon(
                              CupertinoIcons.checkmark_shield_fill,
                              color: Colors.white,
                            )
                          : Text(
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
