// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/MyCard.dart';
import 'package:fyp_frontend/screens/payment/credit_card_details.dart';
import 'package:fyp_frontend/screens/payment/components/card_item.dart';

import '../../config.dart';
import '../../models/login_response_model.dart';
import '../../services/api_service.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_text.dart';

class PaymentProfileScreen extends StatefulWidget {
  const PaymentProfileScreen({Key? key, required this.userDetails})
      : super(key: key);

  final LoginResponseModel? userDetails;

  @override
  _PaymentProfileScreenState createState() => _PaymentProfileScreenState();
}

class _PaymentProfileScreenState extends State<PaymentProfileScreen> {
  late List<MyCard> cardsList;
  bool isLoading = true;
  late final LoginResponseModel userDetails;
  String userImage = "";

  getCards(BuildContext context) async {
    await APIService.getCards(userDetails.data.id.toString())
        .then((response) async {
      if (response == null) {
        print("No Card Found : Failed");
        setState(() {
          isLoading = false;
        });
        return false;
      } else {
        cardsList = response;
        print("Cards Found : Success $cardsList");
        setState(() {
          isLoading = false;
        });
        return true;
      }
    });
  }

  addCardscreen() async {
    MyCard? card = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreditCardDetailsScreen(
            fromScreen: "PaymentProfileScreen",
          ),
        ));

    if (card != null) {
      setState(() {
        cardsList.add(card);
      });
    }
  }

  onDeleteCard(int index) async {
    print("Card ID: ${cardsList[index].cardId}");
    bool isDeleted =
        await APIService.deleteCard(cardsList[index].cardId.toString())
            .then((response) async {
      if (response == false) {
        print("No Card Found : Failed");
        return false;
      } else {
        print("Cards Found : Deleted Success");
        return true;
      }
    });

    if (isDeleted) {
      setState(() {
        cardsList.removeAt(index);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    userDetails = widget.userDetails!;
    userImage = userDetails.data.userImage;
    cardsList = [];
    getCards(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          elevation: 0,
          backgroundColor: primaryColor,
          title: const Text("Payment"),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                addCardscreen();
              },
            ),
          ]),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  width: double.infinity, color: primaryColor, height: 50),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                elevation: 2,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: MyColors.grey_10,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: (userImage == "")
                              ? const NetworkImage(
                                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
                              : NetworkImage(Config.imgURL + userImage),
                        ),
                      ),
                      Container(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(userDetails.data.username,
                                style: MyText.medium(context).copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold)),
                            Container(height: 2),
                            Text(userDetails.data.email,
                                style: MyText.body1(context)!
                                    .copyWith(color: MyColors.grey_40)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(width: 5),
                    Text("Linked Cards",
                        style: MyText.subhead(context)!.copyWith(
                            color: MyColors.grey_60,
                            fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text('${cardsList.length} Card(s)',
                        style: MyText.subhead(context)!.copyWith(
                            color: primaryColor, fontWeight: FontWeight.bold)),
                    Container(width: 5),
                  ],
                ),
                Container(height: 10),
              ],
            ),
          ),
          Container(height: 10),
          Expanded(
            child: (isLoading)
                ? const Center(child: CircularProgressIndicator())
                : (cardsList.isNotEmpty)
                    ? GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.5,
                        ),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding / 2),
                          child: CardItem(
                            cardDetails: cardsList[index],
                            press: () {
                              onDeleteCard(index);
                            },
                          ),
                        ),
                        itemCount: cardsList.length,
                        scrollDirection: Axis.vertical,
                      )
                    : Center(
                        child: Text(
                          "No Cards Found",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
