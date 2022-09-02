import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp_frontend/models/MyPagination.dart';

part 'ProductFilterModel.freezed.dart';

@freezed
abstract class ProductFilterModel with _$ProductFilterModel {
  factory ProductFilterModel(
      {required MyPaginationModel paginationModel,
      String? categoryId}) = _ProductFilterModel;
}
