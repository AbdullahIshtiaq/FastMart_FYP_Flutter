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
  String get orderUser => throw _privateConstructorUsedError;
  List<MyProduct>? get orderProducts => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get orderDate => throw _privateConstructorUsedError;
  String get orderTime => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;

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
      String orderUser,
      List<MyProduct>? orderProducts,
      String paymentMethod,
      int quantity,
      double total,
      String orderDate,
      String orderTime,
      String orderStatus});
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
    Object? orderUser = freezed,
    Object? orderProducts = freezed,
    Object? paymentMethod = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
    Object? orderDate = freezed,
    Object? orderTime = freezed,
    Object? orderStatus = freezed,
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
      orderUser: orderUser == freezed
          ? _value.orderUser
          : orderUser // ignore: cast_nullable_to_non_nullable
              as String,
      orderProducts: orderProducts == freezed
          ? _value.orderProducts
          : orderProducts // ignore: cast_nullable_to_non_nullable
              as List<MyProduct>?,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderDate: orderDate == freezed
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderTime: orderTime == freezed
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
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
      String orderUser,
      List<MyProduct>? orderProducts,
      String paymentMethod,
      int quantity,
      double total,
      String orderDate,
      String orderTime,
      String orderStatus});
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
    Object? orderUser = freezed,
    Object? orderProducts = freezed,
    Object? paymentMethod = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
    Object? orderDate = freezed,
    Object? orderTime = freezed,
    Object? orderStatus = freezed,
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
      orderUser: orderUser == freezed
          ? _value.orderUser
          : orderUser // ignore: cast_nullable_to_non_nullable
              as String,
      orderProducts: orderProducts == freezed
          ? _value._orderProducts
          : orderProducts // ignore: cast_nullable_to_non_nullable
              as List<MyProduct>?,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderDate: orderDate == freezed
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderTime: orderTime == freezed
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
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
      required this.orderUser,
      required final List<MyProduct>? orderProducts,
      required this.paymentMethod,
      required this.quantity,
      required this.total,
      required this.orderDate,
      required this.orderTime,
      required this.orderStatus})
      : _orderProducts = orderProducts;

  factory _$_MyOrder.fromJson(Map<String, dynamic> json) =>
      _$$_MyOrderFromJson(json);

  @override
  final String orderId;
  @override
  final String orderNo;
  @override
  final String orderUser;
  final List<MyProduct>? _orderProducts;
  @override
  List<MyProduct>? get orderProducts {
    final value = _orderProducts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String paymentMethod;
  @override
  final int quantity;
  @override
  final double total;
  @override
  final String orderDate;
  @override
  final String orderTime;
  @override
  final String orderStatus;

  @override
  String toString() {
    return 'MyOrder(orderId: $orderId, orderNo: $orderNo, orderUser: $orderUser, orderProducts: $orderProducts, paymentMethod: $paymentMethod, quantity: $quantity, total: $total, orderDate: $orderDate, orderTime: $orderTime, orderStatus: $orderStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyOrder &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality().equals(other.orderNo, orderNo) &&
            const DeepCollectionEquality().equals(other.orderUser, orderUser) &&
            const DeepCollectionEquality()
                .equals(other._orderProducts, _orderProducts) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethod, paymentMethod) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.orderDate, orderDate) &&
            const DeepCollectionEquality().equals(other.orderTime, orderTime) &&
            const DeepCollectionEquality()
                .equals(other.orderStatus, orderStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(orderNo),
      const DeepCollectionEquality().hash(orderUser),
      const DeepCollectionEquality().hash(_orderProducts),
      const DeepCollectionEquality().hash(paymentMethod),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(orderDate),
      const DeepCollectionEquality().hash(orderTime),
      const DeepCollectionEquality().hash(orderStatus));

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
      required final String orderUser,
      required final List<MyProduct>? orderProducts,
      required final String paymentMethod,
      required final int quantity,
      required final double total,
      required final String orderDate,
      required final String orderTime,
      required final String orderStatus}) = _$_MyOrder;

  factory _MyOrder.fromJson(Map<String, dynamic> json) = _$_MyOrder.fromJson;

  @override
  String get orderId;
  @override
  String get orderNo;
  @override
  String get orderUser;
  @override
  List<MyProduct>? get orderProducts;
  @override
  String get paymentMethod;
  @override
  int get quantity;
  @override
  double get total;
  @override
  String get orderDate;
  @override
  String get orderTime;
  @override
  String get orderStatus;
  @override
  @JsonKey(ignore: true)
  _$$_MyOrderCopyWith<_$_MyOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
