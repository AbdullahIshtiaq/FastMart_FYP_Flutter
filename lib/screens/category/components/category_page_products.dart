import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/screens/home/components/product_card.dart';

import '../../../application/state/product_state.dart';
import '../../../constants.dart';
import '../../../models/MyProduct.dart';
import '../../../providers/myProvider.dart';
import '../../details/details_screen.dart';
import 'dart:developer' as developer;

class CategoryPageProducts extends ConsumerWidget {
  CategoryPageProducts({
    Key? key,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _productList(ref);
  }

  Widget _productList(WidgetRef ref) {
    final productsState = ref.watch(productsNotifierProvider);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        developer.log('log me 30: ', name: 'my.app.Category');
        final productViewModel = ref.read(productsNotifierProvider.notifier);
        final productState = ref.watch(productsNotifierProvider);

        if (productState.hasNext) {
          productViewModel.getProducts();
          developer.log('log me 36: ', name: 'my.app.Category');
        }
      }
    });

    if (productsState.products.isEmpty) {
      if (!productsState.hasNext && !productsState.isLoading) {
        return const Center(
          child: Text("No Products"),
        );
      }
      return const Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    }
    return _buildProductList(productsState.products, productsState);
  }

  Widget _buildProductList(
      List<MyProduct> productList, ProductsState productsState) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(defaultPadding / 2),
              child: ProductCard(
                title: productList[index].productName,
                image: productList[index].fullImagePath,
                price: productList[index].productPrice.toInt(),
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(product: productList[index]),
                      ));
                },
              ),
            ),
            itemCount: productList.length,
            scrollDirection: Axis.vertical,
          ),
          Center(
            child: Visibility(
              visible:
                  productsState.isLoading && productsState.products.isNotEmpty,
              child: const SizedBox(
                height: 35,
                width: 35,
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
