import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp_frontend/models/MyProduct.dart';

part 'MyOrder.freezed.dart';

part 'MyOrder.g.dart';

List<MyOrder> orderFromJson(dynamic str) =>
    List<MyOrder>.from((str).map((e) => MyOrder.fromJson(e)));

@freezed
abstract class MyOrder with _$MyOrder {
  factory MyOrder(
      {required String orderId,
      required String orderNo,
      required List<MyProduct> orderProducts,
      required String paymentMethod,
      required double quantity,
      required double total,
      required String orderDate}) = _MyOrder;

  factory MyOrder.fromJson(Map<String, dynamic> json) =>
      _$MyOrderFromJson(json);
}

// extension ProductExt on MyProduct{
//   String get fullImagePath => Config.imgURL+productImg;
// }