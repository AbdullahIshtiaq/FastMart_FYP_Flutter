import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.stockStatus,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  final int price;
  final String stockStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
          boxShadow: myBoxShadow,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFEFBF9),
                      borderRadius: BorderRadius.all(
                          Radius.circular(defaultBorderRadius)),
                    ),
                    child: Image.network(
                      image,
                      height: 150,
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Text(
                      "Rs. $price",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              left: -20,
              top: 18,
              child: (stockStatus == "Out" ||
                      stockStatus == "out" ||
                      stockStatus == "OUT")
                  ? RotationTransition(
                      turns: const AlwaysStoppedAnimation(325 / 360),
                      child: Container(
                        width: 120,
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              "Out of Stock",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
