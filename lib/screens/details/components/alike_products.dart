import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/models/ProductFilterModel.dart';
import 'package:fyp_frontend/screens/home/components/product_card.dart';
import 'package:fyp_frontend/services/api_service.dart';

import '../../../application/state/product_state.dart';
import '../../../constants.dart';
import '../../../models/MyPagination.dart';
import '../../../models/MyProduct.dart';
import '../../../providers/myProvider.dart';
import 'dart:developer' as developer;

class AlikeProductsScreen extends StatefulWidget {
  const AlikeProductsScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  State<AlikeProductsScreen> createState() => _AlikeProductsScreenState();
}

class _AlikeProductsScreenState extends State<AlikeProductsScreen> {
  List<MyProduct> productList = [];

  getAlikeProducts() async {
    ProductFilterModel filterModel = ProductFilterModel(
        paginationModel: MyPaginationModel(page: 1, pageSize: 10),
        categoryId: widget.categoryId);

    await APIService.getProducts(filterModel).then((response) => {
          if (response != null)
            {
              setState(() {
                productList = response;
              })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    getAlikeProducts();
  }

  @override
  Widget build(BuildContext context) {
    return (productList.isNotEmpty)
        ? Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(
                  title: productList[index].productName,
                  image: productList[index].fullImagePath,
                  price: productList[index].productPrice.toInt(),
                  //bgColor: demo_product[index].bgColor,
                  press: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           DetailsScreen(product: productList[index]),
                    //     ));
                  },
                ),
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(width: defaultPadding),
            ),
          )
        // SingleChildScrollView(
        //     physics: const BouncingScrollPhysics(
        //         parent: AlwaysScrollableScrollPhysics()),
        //     scrollDirection: Axis.horizontal,
        //     child: Row(
        //       children: [
        //         GridView.builder(
        //           shrinkWrap: true,
        //           //controller: _scrollController,
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 1,
        //           ),
        //           physics: const ScrollPhysics(),
        //           itemBuilder: (context, index) => Padding(
        //             padding: const EdgeInsets.all(defaultPadding / 2),
        //             child: ProductCard(
        //               title: productList[index].productName,
        //               image: productList[index].fullImagePath,
        //               price: productList[index].productPrice.toInt(),
        //               //bgColor: demo_product[index].bgColor,
        //               press: () {
        //                 // Navigator.push(
        //                 //     context,
        //                 //     MaterialPageRoute(
        //                 //       builder: (context) =>
        //                 //           DetailsScreen(product: productList[index]),
        //                 //     ));
        //               },
        //             ),
        //           ),
        //           itemCount: productList.length,
        //           scrollDirection: Axis.horizontal,
        //         ),
        //       ],
        //     ),
        //   )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
