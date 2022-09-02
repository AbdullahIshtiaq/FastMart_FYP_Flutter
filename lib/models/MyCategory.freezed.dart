// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'MyCategory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyCategory _$MyCategoryFromJson(Map<String, dynamic> json) {
  return _MyCategory.fromJson(json);
}

/// @nodoc
mixin _$MyCategory {
  String get categoryName => throw _privateConstructorUsedError;
  String get categoryImg => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyCategoryCopyWith<MyCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCategoryCopyWith<$Res> {
  factory $MyCategoryCopyWith(
          MyCategory value, $Res Function(MyCategory) then) =
      _$MyCategoryCopyWithImpl<$Res>;
  $Res call({String categoryName, String categoryImg, String categoryId});
}

/// @nodoc
class _$MyCategoryCopyWithImpl<$Res> implements $MyCategoryCopyWith<$Res> {
  _$MyCategoryCopyWithImpl(this._value, this._then);

  final MyCategory _value;
  // ignore: unused_field
  final $Res Function(MyCategory) _then;

  @override
  $Res call({
    Object? categoryName = freezed,
    Object? categoryImg = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_value.copyWith(
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImg: categoryImg == freezed
          ? _value.categoryImg
          : categoryImg // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MyCategoryCopyWith<$Res>
    implements $MyCategoryCopyWith<$Res> {
  factory _$$_MyCategoryCopyWith(
          _$_MyCategory value, $Res Function(_$_MyCategory) then) =
      __$$_MyCategoryCopyWithImpl<$Res>;
  @override
  $Res call({String categoryName, String categoryImg, String categoryId});
}

/// @nodoc
class __$$_MyCategoryCopyWithImpl<$Res> extends _$MyCategoryCopyWithImpl<$Res>
    implements _$$_MyCategoryCopyWith<$Res> {
  __$$_MyCategoryCopyWithImpl(
      _$_MyCategory _value, $Res Function(_$_MyCategory) _then)
      : super(_value, (v) => _then(v as _$_MyCategory));

  @override
  _$_MyCategory get _value => super._value as _$_MyCategory;

  @override
  $Res call({
    Object? categoryName = freezed,
    Object? categoryImg = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_$_MyCategory(
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImg: categoryImg == freezed
          ? _value.categoryImg
          : categoryImg // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyCategory implements _MyCategory {
  _$_MyCategory(
      {required this.categoryName,
      required this.categoryImg,
      required this.categoryId});

  factory _$_MyCategory.fromJson(Map<String, dynamic> json) =>
      _$$_MyCategoryFromJson(json);

  @override
  final String categoryName;
  @override
  final String categoryImg;
  @override
  final String categoryId;

  @override
  String toString() {
    return 'MyCategory(categoryName: $categoryName, categoryImg: $categoryImg, categoryId: $categoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyCategory &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName) &&
            const DeepCollectionEquality()
                .equals(other.categoryImg, categoryImg) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryName),
      const DeepCollectionEquality().hash(categoryImg),
      const DeepCollectionEquality().hash(categoryId));

  @JsonKey(ignore: true)
  @override
  _$$_MyCategoryCopyWith<_$_MyCategory> get copyWith =>
      __$$_MyCategoryCopyWithImpl<_$_MyCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyCategoryToJson(
      this,
    );
  }
}

abstract class _MyCategory implements MyCategory {
  factory _MyCategory(
      {required final String categoryName,
      required final String categoryImg,
      required final String categoryId}) = _$_MyCategory;

  factory _MyCategory.fromJson(Map<String, dynamic> json) =
      _$_MyCategory.fromJson;

  @override
  String get categoryName;
  @override
  String get categoryImg;
  @override
  String get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$_MyCategoryCopyWith<_$_MyCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
