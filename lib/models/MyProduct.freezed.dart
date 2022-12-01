// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'MyProduct.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyProduct _$MyProductFromJson(Map<String, dynamic> json) {
  return _MyProduct.fromJson(json);
}

/// @nodoc
mixin _$MyProduct {
  String get productBarcode => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  MyCategory? get category => throw _privateConstructorUsedError;
  String get productShortDesc => throw _privateConstructorUsedError;
  double get productPrice => throw _privateConstructorUsedError;
  double? get productRetailPrice => throw _privateConstructorUsedError;
  String get productImg => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyProductCopyWith<MyProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyProductCopyWith<$Res> {
  factory $MyProductCopyWith(MyProduct value, $Res Function(MyProduct) then) =
      _$MyProductCopyWithImpl<$Res>;
  $Res call(
      {String productBarcode,
      String productName,
      MyCategory? category,
      String productShortDesc,
      double productPrice,
      double? productRetailPrice,
      String productImg,
      String productId});

  $MyCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$MyProductCopyWithImpl<$Res> implements $MyProductCopyWith<$Res> {
  _$MyProductCopyWithImpl(this._value, this._then);

  final MyProduct _value;
  // ignore: unused_field
  final $Res Function(MyProduct) _then;

  @override
  $Res call({
    Object? productBarcode = freezed,
    Object? productName = freezed,
    Object? category = freezed,
    Object? productShortDesc = freezed,
    Object? productPrice = freezed,
    Object? productRetailPrice = freezed,
    Object? productImg = freezed,
    Object? productId = freezed,
  }) {
    return _then(_value.copyWith(
      productBarcode: productBarcode == freezed
          ? _value.productBarcode
          : productBarcode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MyCategory?,
      productShortDesc: productShortDesc == freezed
          ? _value.productShortDesc
          : productShortDesc // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: productPrice == freezed
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productRetailPrice: productRetailPrice == freezed
          ? _value.productRetailPrice
          : productRetailPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      productImg: productImg == freezed
          ? _value.productImg
          : productImg // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $MyCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $MyCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$$_MyProductCopyWith<$Res> implements $MyProductCopyWith<$Res> {
  factory _$$_MyProductCopyWith(
          _$_MyProduct value, $Res Function(_$_MyProduct) then) =
      __$$_MyProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String productBarcode,
      String productName,
      MyCategory? category,
      String productShortDesc,
      double productPrice,
      double? productRetailPrice,
      String productImg,
      String productId});

  @override
  $MyCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$_MyProductCopyWithImpl<$Res> extends _$MyProductCopyWithImpl<$Res>
    implements _$$_MyProductCopyWith<$Res> {
  __$$_MyProductCopyWithImpl(
      _$_MyProduct _value, $Res Function(_$_MyProduct) _then)
      : super(_value, (v) => _then(v as _$_MyProduct));

  @override
  _$_MyProduct get _value => super._value as _$_MyProduct;

  @override
  $Res call({
    Object? productBarcode = freezed,
    Object? productName = freezed,
    Object? category = freezed,
    Object? productShortDesc = freezed,
    Object? productPrice = freezed,
    Object? productRetailPrice = freezed,
    Object? productImg = freezed,
    Object? productId = freezed,
  }) {
    return _then(_$_MyProduct(
      productBarcode: productBarcode == freezed
          ? _value.productBarcode
          : productBarcode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MyCategory?,
      productShortDesc: productShortDesc == freezed
          ? _value.productShortDesc
          : productShortDesc // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: productPrice == freezed
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productRetailPrice: productRetailPrice == freezed
          ? _value.productRetailPrice
          : productRetailPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      productImg: productImg == freezed
          ? _value.productImg
          : productImg // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyProduct implements _MyProduct {
  _$_MyProduct(
      {required this.productBarcode,
      required this.productName,
      this.category,
      required this.productShortDesc,
      required this.productPrice,
      this.productRetailPrice,
      required this.productImg,
      required this.productId});

  factory _$_MyProduct.fromJson(Map<String, dynamic> json) =>
      _$$_MyProductFromJson(json);

  @override
  final String productBarcode;
  @override
  final String productName;
  @override
  final MyCategory? category;
  @override
  final String productShortDesc;
  @override
  final double productPrice;
  @override
  final double? productRetailPrice;
  @override
  final String productImg;
  @override
  final String productId;

  @override
  String toString() {
    return 'MyProduct(productBarcode: $productBarcode, productName: $productName, category: $category, productShortDesc: $productShortDesc, productPrice: $productPrice, productRetailPrice: $productRetailPrice, productImg: $productImg, productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyProduct &&
            const DeepCollectionEquality()
                .equals(other.productBarcode, productBarcode) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.productShortDesc, productShortDesc) &&
            const DeepCollectionEquality()
                .equals(other.productPrice, productPrice) &&
            const DeepCollectionEquality()
                .equals(other.productRetailPrice, productRetailPrice) &&
            const DeepCollectionEquality()
                .equals(other.productImg, productImg) &&
            const DeepCollectionEquality().equals(other.productId, productId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(productBarcode),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(productShortDesc),
      const DeepCollectionEquality().hash(productPrice),
      const DeepCollectionEquality().hash(productRetailPrice),
      const DeepCollectionEquality().hash(productImg),
      const DeepCollectionEquality().hash(productId));

  @JsonKey(ignore: true)
  @override
  _$$_MyProductCopyWith<_$_MyProduct> get copyWith =>
      __$$_MyProductCopyWithImpl<_$_MyProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyProductToJson(
      this,
    );
  }
}

abstract class _MyProduct implements MyProduct {
  factory _MyProduct(
      {required final String productBarcode,
      required final String productName,
      final MyCategory? category,
      required final String productShortDesc,
      required final double productPrice,
      final double? productRetailPrice,
      required final String productImg,
      required final String productId}) = _$_MyProduct;

  factory _MyProduct.fromJson(Map<String, dynamic> json) =
      _$_MyProduct.fromJson;

  @override
  String get productBarcode;
  @override
  String get productName;
  @override
  MyCategory? get category;
  @override
  String get productShortDesc;
  @override
  double get productPrice;
  @override
  double? get productRetailPrice;
  @override
  String get productImg;
  @override
  String get productId;
  @override
  @JsonKey(ignore: true)
  _$$_MyProductCopyWith<_$_MyProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
