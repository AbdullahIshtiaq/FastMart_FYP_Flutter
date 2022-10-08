// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'OrderPayment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) {
  return _OrderPayment.fromJson(json);
}

/// @nodoc
mixin _$OrderPayment {
  String get stripeCustomerID => throw _privateConstructorUsedError;
  String get cardID => throw _privateConstructorUsedError;
  String get paymentIntentID => throw _privateConstructorUsedError;
  String get orderID => throw _privateConstructorUsedError;
  String get client_secret => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderPaymentCopyWith<OrderPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPaymentCopyWith<$Res> {
  factory $OrderPaymentCopyWith(
          OrderPayment value, $Res Function(OrderPayment) then) =
      _$OrderPaymentCopyWithImpl<$Res>;
  $Res call(
      {String stripeCustomerID,
      String cardID,
      String paymentIntentID,
      String orderID,
      String client_secret});
}

/// @nodoc
class _$OrderPaymentCopyWithImpl<$Res> implements $OrderPaymentCopyWith<$Res> {
  _$OrderPaymentCopyWithImpl(this._value, this._then);

  final OrderPayment _value;
  // ignore: unused_field
  final $Res Function(OrderPayment) _then;

  @override
  $Res call({
    Object? stripeCustomerID = freezed,
    Object? cardID = freezed,
    Object? paymentIntentID = freezed,
    Object? orderID = freezed,
    Object? client_secret = freezed,
  }) {
    return _then(_value.copyWith(
      stripeCustomerID: stripeCustomerID == freezed
          ? _value.stripeCustomerID
          : stripeCustomerID // ignore: cast_nullable_to_non_nullable
              as String,
      cardID: cardID == freezed
          ? _value.cardID
          : cardID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentID: paymentIntentID == freezed
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      client_secret: client_secret == freezed
          ? _value.client_secret
          : client_secret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderPaymentCopyWith<$Res>
    implements $OrderPaymentCopyWith<$Res> {
  factory _$$_OrderPaymentCopyWith(
          _$_OrderPayment value, $Res Function(_$_OrderPayment) then) =
      __$$_OrderPaymentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String stripeCustomerID,
      String cardID,
      String paymentIntentID,
      String orderID,
      String client_secret});
}

/// @nodoc
class __$$_OrderPaymentCopyWithImpl<$Res>
    extends _$OrderPaymentCopyWithImpl<$Res>
    implements _$$_OrderPaymentCopyWith<$Res> {
  __$$_OrderPaymentCopyWithImpl(
      _$_OrderPayment _value, $Res Function(_$_OrderPayment) _then)
      : super(_value, (v) => _then(v as _$_OrderPayment));

  @override
  _$_OrderPayment get _value => super._value as _$_OrderPayment;

  @override
  $Res call({
    Object? stripeCustomerID = freezed,
    Object? cardID = freezed,
    Object? paymentIntentID = freezed,
    Object? orderID = freezed,
    Object? client_secret = freezed,
  }) {
    return _then(_$_OrderPayment(
      stripeCustomerID: stripeCustomerID == freezed
          ? _value.stripeCustomerID
          : stripeCustomerID // ignore: cast_nullable_to_non_nullable
              as String,
      cardID: cardID == freezed
          ? _value.cardID
          : cardID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentID: paymentIntentID == freezed
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      client_secret: client_secret == freezed
          ? _value.client_secret
          : client_secret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderPayment implements _OrderPayment {
  _$_OrderPayment(
      {required this.stripeCustomerID,
      required this.cardID,
      required this.paymentIntentID,
      required this.orderID,
      required this.client_secret});

  factory _$_OrderPayment.fromJson(Map<String, dynamic> json) =>
      _$$_OrderPaymentFromJson(json);

  @override
  final String stripeCustomerID;
  @override
  final String cardID;
  @override
  final String paymentIntentID;
  @override
  final String orderID;
  @override
  final String client_secret;

  @override
  String toString() {
    return 'OrderPayment(stripeCustomerID: $stripeCustomerID, cardID: $cardID, paymentIntentID: $paymentIntentID, orderID: $orderID, client_secret: $client_secret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderPayment &&
            const DeepCollectionEquality()
                .equals(other.stripeCustomerID, stripeCustomerID) &&
            const DeepCollectionEquality().equals(other.cardID, cardID) &&
            const DeepCollectionEquality()
                .equals(other.paymentIntentID, paymentIntentID) &&
            const DeepCollectionEquality().equals(other.orderID, orderID) &&
            const DeepCollectionEquality()
                .equals(other.client_secret, client_secret));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stripeCustomerID),
      const DeepCollectionEquality().hash(cardID),
      const DeepCollectionEquality().hash(paymentIntentID),
      const DeepCollectionEquality().hash(orderID),
      const DeepCollectionEquality().hash(client_secret));

  @JsonKey(ignore: true)
  @override
  _$$_OrderPaymentCopyWith<_$_OrderPayment> get copyWith =>
      __$$_OrderPaymentCopyWithImpl<_$_OrderPayment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderPaymentToJson(
      this,
    );
  }
}

abstract class _OrderPayment implements OrderPayment {
  factory _OrderPayment(
      {required final String stripeCustomerID,
      required final String cardID,
      required final String paymentIntentID,
      required final String orderID,
      required final String client_secret}) = _$_OrderPayment;

  factory _OrderPayment.fromJson(Map<String, dynamic> json) =
      _$_OrderPayment.fromJson;

  @override
  String get stripeCustomerID;
  @override
  String get cardID;
  @override
  String get paymentIntentID;
  @override
  String get orderID;
  @override
  String get client_secret;
  @override
  @JsonKey(ignore: true)
  _$$_OrderPaymentCopyWith<_$_OrderPayment> get copyWith =>
      throw _privateConstructorUsedError;
}
