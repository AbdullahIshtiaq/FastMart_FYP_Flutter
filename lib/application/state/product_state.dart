import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp_frontend/models/MyProduct.dart';

part 'product_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  factory ProductsState(
      {@Default(<MyProduct>[]) List<MyProduct> products,
      @Default(true) bool hasNext,
      @Default(false) bool isLoading}) = _ProductsState;
}
