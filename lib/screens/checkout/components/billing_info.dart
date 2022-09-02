import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/Cart.dart';

class BillingInfo extends StatelessWidget {
  const BillingInfo({
    Key? key,
    required this.cartController,
  }) : super(key: key);

  final CartController cartController;

  String getTax() {
    double result = double.parse(cartController.total);
    return (result * 0.07).toStringAsPrecision(4); // 7% of subtotal
  }

  String getTotalWithTax() {
    double result = double.parse(cartController.total);
    return (result + (result * 0.07)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Subtotal:",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Rs. ${cartController.total}",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tax:",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Rs. ${getTax()}",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          const Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total:",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Rs. ${getTotalWithTax()}",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
