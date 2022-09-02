// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'MyOrder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyOrder _$MyOrderFromJson(Map<String, dynamic> json) {
  return _MyOrder.fromJson(json);
}

/// @nodoc
mixin _$MyOrder {
  String get orderId => throw _privateConstructorUsedError;
  String get orderNo => throw _privateConstructorUsedError;
  List<MyProduct> get orderProducts => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get orderDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyOrderCopyWith<MyOrder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyOrderCopyWith<$Res> {
  factory $MyOrderCopyWith(MyOrder value, $Res Function(MyOrder) then) =
      _$MyOrderCopyWithImpl<$Res>;
  $Res call(
      {String orderId,
      String orderNo,
      List<MyProduct> orderProducts,
      String paymentMethod,
      double quantity,
      double total,
      String orderDate});
}

/// @nodoc
class _$MyOrderCopyWithImpl<$Res> implements $MyOrderCopyWith<$Res> {
  _$MyOrderCopyWithImpl(this._value, this._then);

  final MyOrder _value;
  // ignore: unused_field
  final $Res Function(MyOrder) _then;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? orderNo = freezed,
    Object? orderProducts = freezed,
    Object? paymentMethod = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
    Object? orderDate = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNo: orderNo == freezed
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as String,
      orderProducts: orderProducts == freezed
          ? _value.orderProducts
          : orderProducts // ignore: cast_nullable_to_non_nullable
              as List<MyProduct>,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderDate: orderDate == freezed
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MyOrderCopyWith<$Res> implements $MyOrderCopyWith<$Res> {
  factory _$$_MyOrderCopyWith(
          _$_MyOrder value, $Res Function(_$_MyOrder) then) =
      __$$_MyOrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {String orderId,
      String orderNo,
      List<MyProduct> orderProducts,
      String paymentMethod,
      double quantity,
      double total,
      String orderDate});
}

/// @nodoc
class __$$_MyOrderCopyWithImpl<$Res> extends _$MyOrderCopyWithImpl<$Res>
    implements _$$_MyOrderCopyWith<$Res> {
  __$$_MyOrderCopyWithImpl(_$_MyOrder _value, $Res Function(_$_MyOrder) _then)
      : super(_value, (v) => _then(v as _$_MyOrder));

  @override
  _$_MyOrder get _value => super._value as _$_MyOrder;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? orderNo = freezed,
    Object? orderProducts = freezed,
    Object? paymentMethod = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
    Object? orderDate = freezed,
  }) {
    return _then(_$_MyOrder(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNo: orderNo == freezed
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as String,
      orderProducts: orderProducts == freezed
          ? _value._orderProducts
          : orderProducts // ignore: cast_nullable_to_non_nullable
              as List<MyProduct>,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderDate: orderDate == freezed
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyOrder implements _MyOrder {
  _$_MyOrder(
      {required this.orderId,
      required this.orderNo,
      required final List<MyProduct> orderProducts,
      required this.paymentMethod,
      required this.quantity,
      required this.total,
      required this.orderDate})
      : _orderProducts = orderProducts;

  factory _$_MyOrder.fromJson(Map<String, dynamic> json) =>
      _$$_MyOrderFromJson(json);

  @override
  final String orderId;
  @override
  final String orderNo;
  final List<MyProduct> _orderProducts;
  @override
  List<MyProduct> get orderProducts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderProducts);
  }

  @override
  final String paymentMethod;
  @override
  final double quantity;
  @override
  final double total;
  @override
  final String orderDate;

  @override
  String toString() {
    return 'MyOrder(orderId: $orderId, orderNo: $orderNo, orderProducts: $orderProducts, paymentMethod: $paymentMethod, quantity: $quantity, total: $total, orderDate: $orderDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyOrder &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality().equals(other.orderNo, orderNo) &&
            const DeepCollectionEquality()
                .equals(other._orderProducts, _orderProducts) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethod, paymentMethod) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.orderDate, orderDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(orderNo),
      const DeepCollectionEquality().hash(_orderProducts),
      const DeepCollectionEquality().hash(paymentMethod),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(orderDate));

  @JsonKey(ignore: true)
  @override
  _$$_MyOrderCopyWith<_$_MyOrder> get copyWith =>
      __$$_MyOrderCopyWithImpl<_$_MyOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyOrderToJson(
      this,
    );
  }
}

abstract class _MyOrder implements MyOrder {
  factory _MyOrder(
      {required final String orderId,
      required final String orderNo,
      required final List<MyProduct> orderProducts,
      required final String paymentMethod,
      required final double quantity,
      required final double total,
      required final String orderDate}) = _$_MyOrder;

  factory _MyOrder.fromJson(Map<String, dynamic> json) = _$_MyOrder.fromJson;

  @override
  String get orderId;
  @override
  String get orderNo;
  @override
  List<MyProduct> get orderProducts;
  @override
  String get paymentMethod;
  @override
  double get quantity;
  @override
  double get total;
  @override
  String get orderDate;
  @override
  @JsonKey(ignore: true)
  _$$_MyOrderCopyWith<_$_MyOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
