import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp_frontend/config.dart';
import 'package:fyp_frontend/models/Category.dart';
import 'package:fyp_frontend/models/MyProduct.dart';

import '../../../constants.dart';

class OrderItemImages extends StatefulWidget {
  const OrderItemImages({Key? key, required this.productsList})
      : super(key: key);

  final List<MyProduct> productsList;

  @override
  State<OrderItemImages> createState() => _OrderItemImagesState();
}

class _OrderItemImagesState extends State<OrderItemImages> {
  late List<MyProduct> filteredList;

  @override
  void initState() {
    super.initState();

    filteredList = widget.productsList.toSet().toList();
    filteredList.forEach((f) => print("Order Line 27 ${f.productName}"));
  }

  // filterProducts() {
  //   filteredList = widget.productsList
  //       .where((product) => !widget.productsList.contains(product.productId))
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filteredList.length,
        itemBuilder: (context, index) => ProductImgCard(
          icon: filteredList[index].productImg,
          title: filteredList[index].productName,
          press: () {},
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(width: defaultPadding),
      ),
    );
  }
}

class ProductImgCard extends StatelessWidget {
  const ProductImgCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                Config.imgURL + icon,
                height: 50,
                width: 50,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
