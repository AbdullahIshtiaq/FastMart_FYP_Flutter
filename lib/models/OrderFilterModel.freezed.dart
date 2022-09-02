// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'OrderFilterModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderFilterModel {
  MyPaginationModel get paginationModel => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderFilterModelCopyWith<OrderFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderFilterModelCopyWith<$Res> {
  factory $OrderFilterModelCopyWith(
          OrderFilterModel value, $Res Function(OrderFilterModel) then) =
      _$OrderFilterModelCopyWithImpl<$Res>;
  $Res call({MyPaginationModel paginationModel, String? userId});

  $MyPaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class _$OrderFilterModelCopyWithImpl<$Res>
    implements $OrderFilterModelCopyWith<$Res> {
  _$OrderFilterModelCopyWithImpl(this._value, this._then);

  final OrderFilterModel _value;
  // ignore: unused_field
  final $Res Function(OrderFilterModel) _then;

  @override
  $Res call({
    Object? paginationModel = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      paginationModel: paginationModel == freezed
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as MyPaginationModel,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $MyPaginationModelCopyWith<$Res> get paginationModel {
    return $MyPaginationModelCopyWith<$Res>(_value.paginationModel, (value) {
      return _then(_value.copyWith(paginationModel: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderFilterModelCopyWith<$Res>
    implements $OrderFilterModelCopyWith<$Res> {
  factory _$$_OrderFilterModelCopyWith(
          _$_OrderFilterModel value, $Res Function(_$_OrderFilterModel) then) =
      __$$_OrderFilterModelCopyWithImpl<$Res>;
  @override
  $Res call({MyPaginationModel paginationModel, String? userId});

  @override
  $MyPaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class __$$_OrderFilterModelCopyWithImpl<$Res>
    extends _$OrderFilterModelCopyWithImpl<$Res>
    implements _$$_OrderFilterModelCopyWith<$Res> {
  __$$_OrderFilterModelCopyWithImpl(
      _$_OrderFilterModel _value, $Res Function(_$_OrderFilterModel) _then)
      : super(_value, (v) => _then(v as _$_OrderFilterModel));

  @override
  _$_OrderFilterModel get _value => super._value as _$_OrderFilterModel;

  @override
  $Res call({
    Object? paginationModel = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_OrderFilterModel(
      paginationModel: paginationModel == freezed
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as MyPaginationModel,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_OrderFilterModel implements _OrderFilterModel {
  _$_OrderFilterModel({required this.paginationModel, this.userId});

  @override
  final MyPaginationModel paginationModel;
  @override
  final String? userId;

  @override
  String toString() {
    return 'OrderFilterModel(paginationModel: $paginationModel, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderFilterModel &&
            const DeepCollectionEquality()
                .equals(other.paginationModel, paginationModel) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(paginationModel),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_OrderFilterModelCopyWith<_$_OrderFilterModel> get copyWith =>
      __$$_OrderFilterModelCopyWithImpl<_$_OrderFilterModel>(this, _$identity);
}

abstract class _OrderFilterModel implements OrderFilterModel {
  factory _OrderFilterModel(
      {required final MyPaginationModel paginationModel,
      final String? userId}) = _$_OrderFilterModel;

  @override
  MyPaginationModel get paginationModel;
  @override
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$_OrderFilterModelCopyWith<_$_OrderFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
