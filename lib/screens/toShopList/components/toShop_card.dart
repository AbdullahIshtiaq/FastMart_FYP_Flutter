import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/models/ToShopList.dart';
import 'package:fyp_frontend/screens/toShopList/toShopList_screen.dart';

import '../../../constants.dart';

class ToShopCard extends StatefulWidget {
  const ToShopCard({
    Key? key,
    required this.toShopList,
    required this.press,
    required this.toShopListController,
    required this.index,
  }) : super(key: key);

  final ToShopList toShopList;
  final ToShopListController toShopListController;
  final VoidCallback press;
  final int index;

  @override
  State<ToShopCard> createState() => _ToShopCardState();
}

class _ToShopCardState extends State<ToShopCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.fromLTRB(defaultPadding, 0.0, defaultPadding, 0.0),
      decoration: BoxDecoration(
        //color: Colors.white,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.toShopList.title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Total Products: ${widget.toShopList.listProducts.length}",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.create,
                  color: primaryColor,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToShopListScreen(
                          //toShopList: widget.toShopList,
                          index: widget.index,
                          //toShopListController: widget.toShopListController,
                        ),
                      )).then((value) => {setState(() {})});
                },
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.delete_solid,
                    color: primaryColor,
                  ),
                  onPressed: widget.press,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
