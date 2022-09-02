import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/application/state/product_state.dart';
import 'package:fyp_frontend/models/MyPagination.dart';
import 'package:fyp_frontend/models/ProductFilterModel.dart';
import 'package:fyp_frontend/services/api_service.dart';

class ProductNotifier extends StateNotifier<ProductsState> {
  final APIService apiService;
  final ProductFilterModel productFilterModel;

  ProductNotifier(this.apiService, this.productFilterModel)
      : super(ProductsState());

  int page = 1;

  Future<void> getProducts() async {
    if (state.isLoading || !state.hasNext) {
      return;
    }

    state = state.copyWith(isLoading: true);

    var filterModel = productFilterModel.copyWith(
        paginationModel: MyPaginationModel(page: page, pageSize: 10));

    final products = await apiService.getProducts(filterModel);
    final newProducts = [...state.products, ...products!];

    if (products.length % 10 != 0 || products.isEmpty) {
      state = state.copyWith(hasNext: false);
    }

    state = state.copyWith(products: newProducts);

    page++;

    state = state.copyWith(isLoading: false);
  }
}
