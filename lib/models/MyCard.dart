// ignore_for_file: file_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'MyCard.freezed.dart';
part 'MyCard.g.dart';

List<MyCard> cardFromJson(dynamic str) =>
    List<MyCard>.from((str).map((e) => MyCard.fromJson(e)));

@freezed
abstract class MyCard with _$MyCard {
  factory MyCard(
      {required String cardId,
      required String cardNumber,
      required String cardName,
      required String cardExpYear,
      required String cardExpMonth,
      required String cardCVC}) = _MyCard;

  factory MyCard.fromJson(Map<String, dynamic> json) => _$MyCardFromJson(json);
}
