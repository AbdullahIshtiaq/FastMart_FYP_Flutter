import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/application/state/order_state.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/MyOrder.dart';
import 'package:fyp_frontend/models/MyPagination.dart';
import 'package:fyp_frontend/models/OrderFilterModel.dart';
import 'package:fyp_frontend/providers/myProvider.dart';
import 'dart:developer' as developer;
import 'order_card.dart';

class OrdersScreenProducts extends ConsumerWidget {
  OrdersScreenProducts({Key? key, required this.userId}) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _orderList(ref);
  }

  Future<void> _processingData(WidgetRef ref) async {
    OrderFilterModel filterModel = OrderFilterModel(
        paginationModel: MyPaginationModel(page: 1, pageSize: 10),
        userId: userId);
    ref.read(ordersFilterProvider.notifier).setOrderFilter(filterModel);
    ref.read(ordersNotifierProvider.notifier).getOrders();

    developer.log('log me 30: ', name: 'my.app.Order 35');
  }

  Widget _orderList(WidgetRef ref) {
    return FutureBuilder(
      future: _processingData(ref),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        developer.log('log me 37: ', name: 'my.app.Order');
        final ordersState = ref.watch(ordersNotifierProvider);

        _scrollController.addListener(() {
          if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
            developer.log('log me 42: ', name: 'my.app.Order');
            final orderViewModel = ref.read(ordersNotifierProvider.notifier);
            final orderState = ref.watch(ordersNotifierProvider);

            if (orderState.hasNext) {
              orderViewModel.getOrders();
              developer.log('log me 49: ', name: 'my.app.Order');
            }
          }
        });

        developer.log('log me 55: ', name: 'my.app.Order');
        if (ordersState.orders.isEmpty) {
          developer.log('log me 57: Empty', name: 'my.app.Order');

          if (!ordersState.hasNext && !ordersState.isLoading) {
            return const Center(
              child: Text("No Orders"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }

        return _buildOrderList(ordersState.orders, ordersState, context);
      },
    );
  }

  Widget _buildOrderList(
      List<MyOrder> orderList, OrdersState ordersState, BuildContext context) {
    return Expanded(
      child: GridView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
          child: OrderCard(
            order: orderList[index],
          ),
        ),
        itemCount: orderList.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
