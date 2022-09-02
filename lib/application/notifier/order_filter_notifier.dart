import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/models/MyPagination.dart';
import 'package:fyp_frontend/models/OrderFilterModel.dart';

class OrderFilterNotifier extends StateNotifier<OrderFilterModel> {
  OrderFilterNotifier()
      : super(OrderFilterModel(
            paginationModel: MyPaginationModel(page: 0, pageSize: 10)));

  void setOrderFilter(OrderFilterModel model) {
    state = model;
  }
}
