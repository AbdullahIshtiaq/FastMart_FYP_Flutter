import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/application/notifier/order_filter_notifier.dart';
import 'package:fyp_frontend/application/notifier/orders_notifier.dart';
import 'package:fyp_frontend/application/notifier/product_filter_notifier.dart';
import 'package:fyp_frontend/application/notifier/products_notifier.dart';
import 'package:fyp_frontend/application/state/order_state.dart';
import 'package:fyp_frontend/application/state/product_state.dart';
import 'package:fyp_frontend/models/MyCategory.dart';
import 'package:fyp_frontend/models/MyPagination.dart';
import 'package:fyp_frontend/models/OrderFilterModel.dart';
import 'package:fyp_frontend/services/api_service.dart';

import '../models/MyProduct.dart';
import '../models/ProductFilterModel.dart';

final categoriesProvider =
    FutureProvider.family<List<MyCategory>?, MyPaginationModel>(
  (ref, paginationModel) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getCategories(
        paginationModel.page, paginationModel.pageSize);
  },
);

// final productsProvider =
//     FutureProvider.family<List<MyProduct>?, ProductFilterModel>(
//   (ref, productFilterModel) {
//     final apiRepository = ref.watch(apiService);
//     return apiRepository.getProducts(productFilterModel);
//   },
// );

final productsFilterProvider =
    StateNotifierProvider<ProductFilterNotifier, ProductFilterModel>(
  (ref) => ProductFilterNotifier(),
);

final productsNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductsState>(
  (ref) =>
      ProductNotifier(ref.watch(apiService), ref.watch(productsFilterProvider)),
);

final ordersFilterProvider =
    StateNotifierProvider<OrderFilterNotifier, OrderFilterModel>(
  (ref) => OrderFilterNotifier(),
);

final ordersNotifierProvider =
    StateNotifierProvider<OrderNotifier, OrdersState>(
  (ref) =>
      OrderNotifier(ref.watch(apiService), ref.watch(ordersFilterProvider)),
);
