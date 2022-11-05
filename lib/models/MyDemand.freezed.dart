// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'MyDemand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyDemand _$MyDemandFromJson(Map<String, dynamic> json) {
  return _MyDemand.fromJson(json);
}

/// @nodoc
mixin _$MyDemand {
  String get demandId => throw _privateConstructorUsedError;
  String get demandProduct => throw _privateConstructorUsedError;
  String get demandProgress => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get demandStatus => throw _privateConstructorUsedError;
  String get createdDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyDemandCopyWith<MyDemand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyDemandCopyWith<$Res> {
  factory $MyDemandCopyWith(MyDemand value, $Res Function(MyDemand) then) =
      _$MyDemandCopyWithImpl<$Res>;
  $Res call(
      {String demandId,
      String demandProduct,
      String demandProgress,
      String message,
      String demandStatus,
      String createdDateTime});
}

/// @nodoc
class _$MyDemandCopyWithImpl<$Res> implements $MyDemandCopyWith<$Res> {
  _$MyDemandCopyWithImpl(this._value, this._then);

  final MyDemand _value;
  // ignore: unused_field
  final $Res Function(MyDemand) _then;

  @override
  $Res call({
    Object? demandId = freezed,
    Object? demandProduct = freezed,
    Object? demandProgress = freezed,
    Object? message = freezed,
    Object? demandStatus = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      demandId: demandId == freezed
          ? _value.demandId
          : demandId // ignore: cast_nullable_to_non_nullable
              as String,
      demandProduct: demandProduct == freezed
          ? _value.demandProduct
          : demandProduct // ignore: cast_nullable_to_non_nullable
              as String,
      demandProgress: demandProgress == freezed
          ? _value.demandProgress
          : demandProgress // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      demandStatus: demandStatus == freezed
          ? _value.demandStatus
          : demandStatus // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MyDemandCopyWith<$Res> implements $MyDemandCopyWith<$Res> {
  factory _$$_MyDemandCopyWith(
          _$_MyDemand value, $Res Function(_$_MyDemand) then) =
      __$$_MyDemandCopyWithImpl<$Res>;
  @override
  $Res call(
      {String demandId,
      String demandProduct,
      String demandProgress,
      String message,
      String demandStatus,
      String createdDateTime});
}

/// @nodoc
class __$$_MyDemandCopyWithImpl<$Res> extends _$MyDemandCopyWithImpl<$Res>
    implements _$$_MyDemandCopyWith<$Res> {
  __$$_MyDemandCopyWithImpl(
      _$_MyDemand _value, $Res Function(_$_MyDemand) _then)
      : super(_value, (v) => _then(v as _$_MyDemand));

  @override
  _$_MyDemand get _value => super._value as _$_MyDemand;

  @override
  $Res call({
    Object? demandId = freezed,
    Object? demandProduct = freezed,
    Object? demandProgress = freezed,
    Object? message = freezed,
    Object? demandStatus = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_$_MyDemand(
      demandId: demandId == freezed
          ? _value.demandId
          : demandId // ignore: cast_nullable_to_non_nullable
              as String,
      demandProduct: demandProduct == freezed
          ? _value.demandProduct
          : demandProduct // ignore: cast_nullable_to_non_nullable
              as String,
      demandProgress: demandProgress == freezed
          ? _value.demandProgress
          : demandProgress // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      demandStatus: demandStatus == freezed
          ? _value.demandStatus
          : demandStatus // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyDemand implements _MyDemand {
  _$_MyDemand(
      {required this.demandId,
      required this.demandProduct,
      required this.demandProgress,
      required this.message,
      required this.demandStatus,
      required this.createdDateTime});

  factory _$_MyDemand.fromJson(Map<String, dynamic> json) =>
      _$$_MyDemandFromJson(json);

  @override
  final String demandId;
  @override
  final String demandProduct;
  @override
  final String demandProgress;
  @override
  final String message;
  @override
  final String demandStatus;
  @override
  final String createdDateTime;

  @override
  String toString() {
    return 'MyDemand(demandId: $demandId, demandProduct: $demandProduct, demandProgress: $demandProgress, message: $message, demandStatus: $demandStatus, createdDateTime: $createdDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyDemand &&
            const DeepCollectionEquality().equals(other.demandId, demandId) &&
            const DeepCollectionEquality()
                .equals(other.demandProduct, demandProduct) &&
            const DeepCollectionEquality()
                .equals(other.demandProgress, demandProgress) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.demandStatus, demandStatus) &&
            const DeepCollectionEquality()
                .equals(other.createdDateTime, createdDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(demandId),
      const DeepCollectionEquality().hash(demandProduct),
      const DeepCollectionEquality().hash(demandProgress),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(demandStatus),
      const DeepCollectionEquality().hash(createdDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_MyDemandCopyWith<_$_MyDemand> get copyWith =>
      __$$_MyDemandCopyWithImpl<_$_MyDemand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyDemandToJson(
      this,
    );
  }
}

abstract class _MyDemand implements MyDemand {
  factory _MyDemand(
      {required final String demandId,
      required final String demandProduct,
      required final String demandProgress,
      required final String message,
      required final String demandStatus,
      required final String createdDateTime}) = _$_MyDemand;

  factory _MyDemand.fromJson(Map<String, dynamic> json) = _$_MyDemand.fromJson;

  @override
  String get demandId;
  @override
  String get demandProduct;
  @override
  String get demandProgress;
  @override
  String get message;
  @override
  String get demandStatus;
  @override
  String get createdDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_MyDemandCopyWith<_$_MyDemand> get copyWith =>
      throw _privateConstructorUsedError;
}
