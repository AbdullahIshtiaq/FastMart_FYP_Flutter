// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'MyCard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyCard _$MyCardFromJson(Map<String, dynamic> json) {
  return _MyCard.fromJson(json);
}

/// @nodoc
mixin _$MyCard {
  String get cardId => throw _privateConstructorUsedError;
  String get cardNumber => throw _privateConstructorUsedError;
  String get cardName => throw _privateConstructorUsedError;
  String get cardExpYear => throw _privateConstructorUsedError;
  String get cardExpMonth => throw _privateConstructorUsedError;
  String get cardCVC => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyCardCopyWith<MyCard> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCardCopyWith<$Res> {
  factory $MyCardCopyWith(MyCard value, $Res Function(MyCard) then) =
      _$MyCardCopyWithImpl<$Res>;
  $Res call(
      {String cardId,
      String cardNumber,
      String cardName,
      String cardExpYear,
      String cardExpMonth,
      String cardCVC});
}

/// @nodoc
class _$MyCardCopyWithImpl<$Res> implements $MyCardCopyWith<$Res> {
  _$MyCardCopyWithImpl(this._value, this._then);

  final MyCard _value;
  // ignore: unused_field
  final $Res Function(MyCard) _then;

  @override
  $Res call({
    Object? cardId = freezed,
    Object? cardNumber = freezed,
    Object? cardName = freezed,
    Object? cardExpYear = freezed,
    Object? cardExpMonth = freezed,
    Object? cardCVC = freezed,
  }) {
    return _then(_value.copyWith(
      cardId: cardId == freezed
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: cardNumber == freezed
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cardName: cardName == freezed
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String,
      cardExpYear: cardExpYear == freezed
          ? _value.cardExpYear
          : cardExpYear // ignore: cast_nullable_to_non_nullable
              as String,
      cardExpMonth: cardExpMonth == freezed
          ? _value.cardExpMonth
          : cardExpMonth // ignore: cast_nullable_to_non_nullable
              as String,
      cardCVC: cardCVC == freezed
          ? _value.cardCVC
          : cardCVC // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MyCardCopyWith<$Res> implements $MyCardCopyWith<$Res> {
  factory _$$_MyCardCopyWith(_$_MyCard value, $Res Function(_$_MyCard) then) =
      __$$_MyCardCopyWithImpl<$Res>;
  @override
  $Res call(
      {String cardId,
      String cardNumber,
      String cardName,
      String cardExpYear,
      String cardExpMonth,
      String cardCVC});
}

/// @nodoc
class __$$_MyCardCopyWithImpl<$Res> extends _$MyCardCopyWithImpl<$Res>
    implements _$$_MyCardCopyWith<$Res> {
  __$$_MyCardCopyWithImpl(_$_MyCard _value, $Res Function(_$_MyCard) _then)
      : super(_value, (v) => _then(v as _$_MyCard));

  @override
  _$_MyCard get _value => super._value as _$_MyCard;

  @override
  $Res call({
    Object? cardId = freezed,
    Object? cardNumber = freezed,
    Object? cardName = freezed,
    Object? cardExpYear = freezed,
    Object? cardExpMonth = freezed,
    Object? cardCVC = freezed,
  }) {
    return _then(_$_MyCard(
      cardId: cardId == freezed
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: cardNumber == freezed
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cardName: cardName == freezed
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String,
      cardExpYear: cardExpYear == freezed
          ? _value.cardExpYear
          : cardExpYear // ignore: cast_nullable_to_non_nullable
              as String,
      cardExpMonth: cardExpMonth == freezed
          ? _value.cardExpMonth
          : cardExpMonth // ignore: cast_nullable_to_non_nullable
              as String,
      cardCVC: cardCVC == freezed
          ? _value.cardCVC
          : cardCVC // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyCard implements _MyCard {
  _$_MyCard(
      {required this.cardId,
      required this.cardNumber,
      required this.cardName,
      required this.cardExpYear,
      required this.cardExpMonth,
      required this.cardCVC});

  factory _$_MyCard.fromJson(Map<String, dynamic> json) =>
      _$$_MyCardFromJson(json);

  @override
  final String cardId;
  @override
  final String cardNumber;
  @override
  final String cardName;
  @override
  final String cardExpYear;
  @override
  final String cardExpMonth;
  @override
  final String cardCVC;

  @override
  String toString() {
    return 'MyCard(cardId: $cardId, cardNumber: $cardNumber, cardName: $cardName, cardExpYear: $cardExpYear, cardExpMonth: $cardExpMonth, cardCVC: $cardCVC)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyCard &&
            const DeepCollectionEquality().equals(other.cardId, cardId) &&
            const DeepCollectionEquality()
                .equals(other.cardNumber, cardNumber) &&
            const DeepCollectionEquality().equals(other.cardName, cardName) &&
            const DeepCollectionEquality()
                .equals(other.cardExpYear, cardExpYear) &&
            const DeepCollectionEquality()
                .equals(other.cardExpMonth, cardExpMonth) &&
            const DeepCollectionEquality().equals(other.cardCVC, cardCVC));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cardId),
      const DeepCollectionEquality().hash(cardNumber),
      const DeepCollectionEquality().hash(cardName),
      const DeepCollectionEquality().hash(cardExpYear),
      const DeepCollectionEquality().hash(cardExpMonth),
      const DeepCollectionEquality().hash(cardCVC));

  @JsonKey(ignore: true)
  @override
  _$$_MyCardCopyWith<_$_MyCard> get copyWith =>
      __$$_MyCardCopyWithImpl<_$_MyCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyCardToJson(
      this,
    );
  }
}

abstract class _MyCard implements MyCard {
  factory _MyCard(
      {required final String cardId,
      required final String cardNumber,
      required final String cardName,
      required final String cardExpYear,
      required final String cardExpMonth,
      required final String cardCVC}) = _$_MyCard;

  factory _MyCard.fromJson(Map<String, dynamic> json) = _$_MyCard.fromJson;

  @override
  String get cardId;
  @override
  String get cardNumber;
  @override
  String get cardName;
  @override
  String get cardExpYear;
  @override
  String get cardExpMonth;
  @override
  String get cardCVC;
  @override
  @JsonKey(ignore: true)
  _$$_MyCardCopyWith<_$_MyCard> get copyWith =>
      throw _privateConstructorUsedError;
}
