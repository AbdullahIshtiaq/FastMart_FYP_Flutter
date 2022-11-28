// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyOffer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyOffer _$$_MyOfferFromJson(Map<String, dynamic> json) => _$_MyOffer(
      advertismentTitle: json['advertismentTitle'] as String,
      advertismentDesc: json['advertismentDesc'] as String,
      categoryId: json['categoryId'] == null
          ? null
          : MyCategory.fromJson(json['categoryId'] as Map<String, dynamic>),
      advertismentType: json['advertismentType'] as String,
      createdDateTime: json['createdDateTime'] as String,
      discount: json['discount'] as int,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      advertismentId: json['advertismentId'] as String,
    );

Map<String, dynamic> _$$_MyOfferToJson(_$_MyOffer instance) =>
    <String, dynamic>{
      'advertismentTitle': instance.advertismentTitle,
      'advertismentDesc': instance.advertismentDesc,
      'categoryId': instance.categoryId,
      'advertismentType': instance.advertismentType,
      'createdDateTime': instance.createdDateTime,
      'discount': instance.discount,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'advertismentId': instance.advertismentId,
    };
