import 'package:flutter/material.dart';
import '../../../models/MyCard.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.cardDetails}) : super(key: key);

  final MyCard cardDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Primary Card",
                      style: MyText.medium(context).copyWith(
                          color: MyColors.grey_80,
                          fontWeight: FontWeight.bold)),
                  Container(height: 20),
                  Text("Card Number",
                      style: MyText.body1(context)!
                          .copyWith(color: MyColors.grey_40)),
                  Container(height: 5),
                  Text(cardDetails.cardNumber,
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_80)),
                  Container(height: 20),
                  Text("Card Holder Name",
                      style: MyText.body1(context)!
                          .copyWith(color: MyColors.grey_40)),
                  Container(height: 5),
                  Text(cardDetails.cardName,
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_80)),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/images/ic_mastercard_new.png',
                        width: 40, height: 40),
                  ),
                  Container(height: 5),
                  Text("Exp.",
                      style: MyText.body1(context)!
                          .copyWith(color: MyColors.grey_40)),
                  Container(height: 5),
                  Text("${cardDetails.cardExpMonth}/${cardDetails.cardExpYear}",
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_80)),
                  Container(height: 20),
                  Text("CVV / CVC",
                      style: MyText.body1(context)!
                          .copyWith(color: MyColors.grey_40)),
                  Container(height: 5),
                  Text(cardDetails.cardCVC,
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_80)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
