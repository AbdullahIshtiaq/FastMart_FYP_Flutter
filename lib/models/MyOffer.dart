import 'package:freezed_annotation/freezed_annotation.dart';

import 'MyCategory.dart';

part 'MyOffer.freezed.dart';

part 'MyOffer.g.dart';

List<MyOffer> offerFromJson(dynamic str) =>
    List<MyOffer>.from((str).map((e) => MyOffer.fromJson(e)));

@freezed
abstract class MyOffer with _$MyOffer {
  factory MyOffer({
    required String advertismentTitle,
    required String advertismentDesc,
    MyCategory? categoryId,
    required String advertismentType,
    required String createdDateTime,
    required int discount,
    required String startDate,
    required String endDate,
    required String advertismentId,
  }) = _MyOffer;

  factory MyOffer.fromJson(Map<String, dynamic> json) =>
      _$MyOfferFromJson(json);
}
