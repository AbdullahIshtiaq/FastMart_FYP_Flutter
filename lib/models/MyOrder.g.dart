// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyOrder _$$_MyOrderFromJson(Map<String, dynamic> json) => _$_MyOrder(
      orderId: json['orderId'] as String,
      orderNo: json['orderNo'] as String,
      orderProducts: (json['orderProducts'] as List<dynamic>)
          .map((e) => MyProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentMethod: json['paymentMethod'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      orderDate: json['orderDate'] as String,
    );

Map<String, dynamic> _$$_MyOrderToJson(_$_MyOrder instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderNo': instance.orderNo,
      'orderProducts': instance.orderProducts,
      'paymentMethod': instance.paymentMethod,
      'quantity': instance.quantity,
      'total': instance.total,
      'orderDate': instance.orderDate,
    };
