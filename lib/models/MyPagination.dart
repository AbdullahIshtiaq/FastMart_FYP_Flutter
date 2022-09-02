import 'package:freezed_annotation/freezed_annotation.dart';

part 'MyPagination.freezed.dart';

@freezed
abstract class MyPaginationModel with _$MyPaginationModel {
  factory MyPaginationModel(
      { required int page,
        required int pageSize,
        }) = _MyPaginationModel;
}
