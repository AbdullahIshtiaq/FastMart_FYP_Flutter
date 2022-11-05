import 'package:freezed_annotation/freezed_annotation.dart';

part 'MyDemand.freezed.dart';
part 'MyDemand.g.dart';

List<MyDemand> DemandFromJson(dynamic str) =>
    List<MyDemand>.from((str).map((e) => MyDemand.fromJson(e)));

@freezed
abstract class MyDemand with _$MyDemand {
  factory MyDemand({
    required String demandId,
    required String demandProduct,
    required String demandProgress,
    required String message,
    required String demandStatus,
    required String createdDateTime,
  }) = _MyDemand;

  factory MyDemand.fromJson(Map<String, dynamic> json) =>
      _$MyDemandFromJson(json);
}
