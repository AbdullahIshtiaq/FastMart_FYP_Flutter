import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/models/MyPagination.dart';
import 'package:fyp_frontend/models/ProductFilterModel.dart';
import 'package:fyp_frontend/providers/myProvider.dart';
import 'package:fyp_frontend/screens/category/category_screen.dart';

import '../../../constants.dart';
import '../../../models/MyCategory.dart';
import '../../../utils/my_text.dart';

class Categories extends ConsumerWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _categoryList(context, ref);
  }

  Widget _categoryList(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(
      categoriesProvider(
        MyPaginationModel(page: 1, pageSize: 10),
      ),
    );
    return categories.when(
        data: (list) {
          return _buildCategoryList(list!, context, ref);
        },
        error: (_, __) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.search_off_outlined,
                      size: 50, color: Colors.grey[300]),
                  Container(height: 15),
                  Text("No Category Found",
                      style: MyText.title(context)!.copyWith(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
        loading: () => const Center(
                child: CircularProgressIndicator(
              color: primaryColor,
            )));
  }

  Widget _buildCategoryList(
      List<MyCategory> categoryList, BuildContext context, WidgetRef ref) {
    return (categoryList.isNotEmpty)
        ? SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) => CategoryCard(
                icon: categoryList[index].fullImagePath,
                title: categoryList[index].categoryName,
                press: () {
                  ProductFilterModel filterModel = ProductFilterModel(
                      paginationModel: MyPaginationModel(page: 1, pageSize: 10),
                      categoryId: categoryList[index].categoryId);

                  ref
                      .read(productsFilterProvider.notifier)
                      .setProductFilter(filterModel);
                  ref.read(productsNotifierProvider.notifier).getProducts();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(
                          categoryId: categoryList[index].categoryId,
                          categoryName: categoryList[index].categoryName,
                        ),
                      )).then((value) {
                    developer.log('In Then 69', name: 'my.app.Categories');
                    ProductFilterModel filterModel = ProductFilterModel(
                        paginationModel:
                            MyPaginationModel(page: 1, pageSize: 10));
                    ref
                        .read(productsFilterProvider.notifier)
                        .setProductFilter(filterModel);
                    ref.read(productsNotifierProvider.notifier).getProducts();
                  });
                },
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(width: defaultPadding),
            ),
          )
        : Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.search_off_outlined,
                    size: 50, color: Colors.grey[300]),
                Container(height: 15),
                Text("No Category Found",
                    style: MyText.title(context)!.copyWith(
                        color: Colors.grey[800], fontWeight: FontWeight.bold)),
              ],
            ),
          );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
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
            Expanded(child: Image.network(icon)),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
