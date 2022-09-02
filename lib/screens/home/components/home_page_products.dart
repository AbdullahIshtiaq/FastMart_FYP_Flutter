import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/screens/home/components/product_card.dart';

import '../../../application/state/product_state.dart';
import '../../../constants.dart';
import '../../../models/MyPagination.dart';
import '../../../models/MyProduct.dart';
import '../../../models/ProductFilterModel.dart';
import '../../../providers/myProvider.dart';
import '../../details/details_screen.dart';

import 'dart:developer' as developer;

class HomePageProducts extends ConsumerWidget {
  HomePageProducts({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _productList(ref);
  }

  // void getData(WidgetRef ref) {}

  Future<void> _processingData(WidgetRef ref) async {
    ProductFilterModel filterModel = ProductFilterModel(
        paginationModel: MyPaginationModel(page: 1, pageSize: 10));
    ref.read(productsFilterProvider.notifier).setProductFilter(filterModel);
    ref.read(productsNotifierProvider.notifier).getProducts();
  }

  Widget _productList(WidgetRef ref) {
    return FutureBuilder(
      future: _processingData(ref),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final productsState = ref.watch(productsNotifierProvider);

        _scrollController.addListener(() {
          if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
            developer.log('log me 41: ', name: 'my.app.Product');
            final productViewModel =
                ref.read(productsNotifierProvider.notifier);
            final productState = ref.watch(productsNotifierProvider);

            if (productState.hasNext) {
              productViewModel.getProducts();
              developer.log('log me 48: ', name: 'my.app.Product');
            }
          }
        });
        //developer.log('log me 48: $productsState', name: 'my.app.Produt');
        if (productsState.products.isEmpty) {
          // developer.log('log me 52: $productsState', name: 'my.app.Produt 51');
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
        //developer.log('log me 63: $productsState', name: 'my.app.Produt 51');
        return _buildProductList(productsState.products, productsState);

        ///Main Screen
      },
    );
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
                //bgColor: demo_product[index].bgColor,
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
