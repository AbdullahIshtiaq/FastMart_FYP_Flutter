import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp_frontend/config.dart';

part 'MyCategory.freezed.dart';

part 'MyCategory.g.dart';

List<MyCategory> categoryFromJson(dynamic str) =>
    List<MyCategory>.from((str).map((e) => MyCategory.fromJson(e)));

@freezed
abstract class MyCategory with _$MyCategory {
  factory MyCategory(
      {required String categoryName,
      required String categoryImg,
      required String categoryId}) = _MyCategory;

  factory MyCategory.fromJson(Map<String, dynamic> json) =>
      _$MyCategoryFromJson(json);
}

extension CategoryExt on MyCategory {
  String get fullImagePath => Config.imgURL + categoryImg;
}
