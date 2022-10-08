// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderPayment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderPayment _$$_OrderPaymentFromJson(Map<String, dynamic> json) =>
    _$_OrderPayment(
      stripeCustomerID: json['stripeCustomerID'] as String,
      cardID: json['cardId'] as String,
      paymentIntentID: json['paymentIntentId'] as String,
      orderID: json['orderId'] as String,
      client_secret: json['client_secret'] as String,
    );

Map<String, dynamic> _$$_OrderPaymentToJson(_$_OrderPayment instance) =>
    <String, dynamic>{
      'stripeCustomerID': instance.stripeCustomerID,
      'cardID': instance.cardID,
      'paymentIntentID': instance.paymentIntentID,
      'orderID': instance.orderID,
      'client_secret': instance.client_secret,
    };
