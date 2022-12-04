// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyProduct _$$_MyProductFromJson(Map<String, dynamic> json) => _$_MyProduct(
      productBarcode: json['productBarcode'] as String,
      productName: json['productName'] as String,
      category: json['category'] == null
          ? null
          : MyCategory.fromJson(json['category'] as Map<String, dynamic>),
      productShortDesc: json['productShortDesc'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productRetailPrice: (json['productRetailPrice'] as num?)?.toDouble(),
      productImg: json['productImg'] as String,
      productId: json['productId'] as String,
      stockStatus: json['stockStatus'] as String,
    );

Map<String, dynamic> _$$_MyProductToJson(_$_MyProduct instance) =>
    <String, dynamic>{
      'productBarcode': instance.productBarcode,
      'productName': instance.productName,
      'category': instance.category,
      'productShortDesc': instance.productShortDesc,
      'productPrice': instance.productPrice,
      'productRetailPrice': instance.productRetailPrice,
      'productImg': instance.productImg,
      'productId': instance.productId,
      'stockStatus': instance.stockStatus,
    };
