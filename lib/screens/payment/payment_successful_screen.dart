import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/main.dart';

import '../../config.dart';
import '../../models/Cart.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({Key? key, required this.cartController})
      : super(key: key);

  final CartController cartController;

  Future<void> _clearCartData() async {
    cartController.cartProducts.clear();
  }

  @override
  Widget build(BuildContext context) {
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
        future: _clearCartData(),
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
                        //Image.asset('assets/images/successful.PNG'),
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
                            primary: lightOrange,
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
