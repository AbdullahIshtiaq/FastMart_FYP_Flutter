import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/constants.dart';

import 'components/category_page_products.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({
    Key? key,
    required this.categoryId,
    required this.categoryName,
  }) : super(key: key);

  final String categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        // ProductFilterModel filterModel = ProductFilterModel(
        //     paginationModel: MyPaginationModel(page: 1, pageSize: 10));
        //
        // ref.read(productsFilterProvider.notifier).setProductFilter(filterModel);
        // ref.read(productsNotifierProvider.notifier).getProducts();
        // ref.watch(productsNotifierProvider);
        // print("On Back");
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(
            categoryName,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Products",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(child: CategoryPageProducts()),
            ],
          ),
        ),
      ),
    );
  }
}
