import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/models/MyPagination.dart';
import 'package:fyp_frontend/models/OrderFilterModel.dart';

import '../../services/api_service.dart';
import '../state/order_state.dart';

import 'dart:developer' as developer;

class OrderNotifier extends StateNotifier<OrdersState> {
  final APIService apiService;
  final OrderFilterModel orderFilterModel;

  OrderNotifier(this.apiService, this.orderFilterModel) : super(OrdersState());

  int page = 1;

  Future<void> getOrders() async {
    developer.log('log me 17: ', name: 'my.app.OrderNotifier 17');
    if (state.isLoading || !state.hasNext) {
      return;
    }

    developer.log('log me 22: ', name: 'my.app.OrderNotifier 22');

    state = state.copyWith(isLoading: true);

    var filterModel = orderFilterModel.copyWith(
        paginationModel: MyPaginationModel(page: page, pageSize: 10));

    developer.log('log me 30: $filterModel', name: 'my.app.OrderNotifier 30');

    final orders = await apiService.getOrders(filterModel);

    developer.log('log me 34: ', name: 'my.app.OrderNotifier 34');

    final newOrders = [...state.orders, ...orders!];

    developer.log('log me 38: ', name: 'my.app.OrderNotifier 38');
    if (orders.length % 10 != 0 || orders.isEmpty) {
      state = state.copyWith(hasNext: false);
    }

    state = state.copyWith(orders: newOrders);

    page++;

    state = state.copyWith(isLoading: false);
  }
}
