import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp_frontend/models/MyOrder.dart';

part 'order_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  factory OrdersState(
      {@Default(<MyOrder>[]) List<MyOrder> orders,
      @Default(true) bool hasNext,
      @Default(false) bool isLoading}) = _OrdersState;
}
