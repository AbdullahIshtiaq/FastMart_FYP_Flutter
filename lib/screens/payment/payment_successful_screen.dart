import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/main.dart';
import '../../config.dart';
import '../../models/Cart.dart';
import '../../models/MyPagination.dart';
import '../../models/OrderFilterModel.dart';
import '../../providers/myProvider.dart';
import '../../services/shared_service.dart';

class PaymentSuccessfulScreen extends ConsumerWidget {
  const PaymentSuccessfulScreen({Key? key, required this.cartController})
      : super(key: key);

  final CartController cartController;

  Future<void> _clearCartData(WidgetRef ref) async {
    cartController.cartProducts.clear();

    var userDetails = await SharedService.loginDetails();
    print(userDetails);

    OrderFilterModel filterModel = OrderFilterModel(
        paginationModel: MyPaginationModel(page: 1, pageSize: 10),
        userId: userDetails!.data.id);
    ref.read(ordersFilterProvider.notifier).setOrderFilter(filterModel);
    ref.read(ordersNotifierProvider.notifier).getOrders();

    print("line 34");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () {
        Config.selectedIndex = 0;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const MainScreen(),
            ),
            (Route<dynamic> route) => false);

        return Future.value(false);
      },
      child: FutureBuilder(
        future: _clearCartData(ref),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //       const CheckoutScreen(),
                          //     ));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
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
          );
        },
      ),
    );
  }
}
