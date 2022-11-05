// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyDemand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyDemand _$$_MyDemandFromJson(Map<String, dynamic> json) => _$_MyDemand(
      demandId: json['demandId'] as String,
      demandProduct: json['demandProduct'] as String,
      demandProgress: json['demandProgress'] as String,
      message: json['message'] as String,
      demandStatus: json['demandStatus'] as String,
      createdDateTime: json['createdDateTime'] as String,
    );

Map<String, dynamic> _$$_MyDemandToJson(_$_MyDemand instance) =>
    <String, dynamic>{
      'demandId': instance.demandId,
      'demandProduct': instance.demandProduct,
      'demandProgress': instance.demandProgress,
      'message': instance.message,
      'demandStatus': instance.demandStatus,
      'createdDateTime': instance.createdDateTime,
    };
