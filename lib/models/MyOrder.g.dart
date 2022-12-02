// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyOrder _$$_MyOrderFromJson(Map<String, dynamic> json) => _$_MyOrder(
      orderId: json['orderId'] as String,
      orderNo: json['orderNo'] as String,
      orderUser: json['orderUser'] as String,
      orderProducts: (json['orderProducts'] as List<dynamic>?)
          ?.map((e) => MyProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentMethod: json['paymentMethod'] as String,
      quantity: json['quantity'] as int,
      total: (json['total'] as num).toDouble(),
      orderDate: json['orderDate'] as String,
      orderTime: json['orderTime'] as String,
      orderStatus: json['orderStatus'] as String,
    );

Map<String, dynamic> _$$_MyOrderToJson(_$_MyOrder instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderNo': instance.orderNo,
      'orderUser': instance.orderUser,
      'orderProducts': instance.orderProducts,
      'paymentMethod': instance.paymentMethod,
      'quantity': instance.quantity,
      'total': instance.total,
      'orderDate': instance.orderDate,
      'orderTime': instance.orderTime,
      'orderStatus': instance.orderStatus,
    };
