// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'MyPagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyPaginationModel {
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPaginationModelCopyWith<MyPaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPaginationModelCopyWith<$Res> {
  factory $MyPaginationModelCopyWith(
          MyPaginationModel value, $Res Function(MyPaginationModel) then) =
      _$MyPaginationModelCopyWithImpl<$Res>;
  $Res call({int page, int pageSize});
}

/// @nodoc
class _$MyPaginationModelCopyWithImpl<$Res>
    implements $MyPaginationModelCopyWith<$Res> {
  _$MyPaginationModelCopyWithImpl(this._value, this._then);

  final MyPaginationModel _value;
  // ignore: unused_field
  final $Res Function(MyPaginationModel) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_MyPaginationModelCopyWith<$Res>
    implements $MyPaginationModelCopyWith<$Res> {
  factory _$$_MyPaginationModelCopyWith(_$_MyPaginationModel value,
          $Res Function(_$_MyPaginationModel) then) =
      __$$_MyPaginationModelCopyWithImpl<$Res>;
  @override
  $Res call({int page, int pageSize});
}

/// @nodoc
class __$$_MyPaginationModelCopyWithImpl<$Res>
    extends _$MyPaginationModelCopyWithImpl<$Res>
    implements _$$_MyPaginationModelCopyWith<$Res> {
  __$$_MyPaginationModelCopyWithImpl(
      _$_MyPaginationModel _value, $Res Function(_$_MyPaginationModel) _then)
      : super(_value, (v) => _then(v as _$_MyPaginationModel));

  @override
  _$_MyPaginationModel get _value => super._value as _$_MyPaginationModel;

  @override
  $Res call({
    Object? page = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_$_MyPaginationModel(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MyPaginationModel implements _MyPaginationModel {
  _$_MyPaginationModel({required this.page, required this.pageSize});

  @override
  final int page;
  @override
  final int pageSize;

  @override
  String toString() {
    return 'MyPaginationModel(page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyPaginationModel &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.pageSize, pageSize));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(pageSize));

  @JsonKey(ignore: true)
  @override
  _$$_MyPaginationModelCopyWith<_$_MyPaginationModel> get copyWith =>
      __$$_MyPaginationModelCopyWithImpl<_$_MyPaginationModel>(
          this, _$identity);
}

abstract class _MyPaginationModel implements MyPaginationModel {
  factory _MyPaginationModel(
      {required final int page,
      required final int pageSize}) = _$_MyPaginationModel;

  @override
  int get page;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$_MyPaginationModelCopyWith<_$_MyPaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
