// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyCard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyCard _$$_MyCardFromJson(Map<String, dynamic> json) => _$_MyCard(
      cardId: json['cardId'] as String,
      cardNumber: json['cardNumber'] as String,
      cardName: json['cardName'] as String,
      cardExpYear: json['cardExpYear'] as String,
      cardExpMonth: json['cardExpMonth'] as String,
      cardCVC: json['cardCVC'] as String,
    );

Map<String, dynamic> _$$_MyCardToJson(_$_MyCard instance) => <String, dynamic>{
      'cardId': instance.cardId,
      'cardNumber': instance.cardNumber,
      'cardName': instance.cardName,
      'cardExpYear': instance.cardExpYear,
      'cardExpMonth': instance.cardExpMonth,
      'cardCVC': instance.cardCVC,
    };
