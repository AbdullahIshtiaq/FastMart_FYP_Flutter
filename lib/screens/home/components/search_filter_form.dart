import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../constants.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  double myRating = 1;
  double _startValue = 0.0;
  double _endValue = 5000.0;
  bool isSwitched1 = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Container(
        color: bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height: 35),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                title: Text("Filter",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: primaryColor, fontWeight: FontWeight.w500)),
                trailing:
                    const Icon(Icons.close, size: 20, color: primaryColor),
                onTap: () {
                  Navigator.maybePop(context);
                },
              ),
            ),
            Container(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text("Keyword",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.grey)),
            ),
            Container(
              height: 40,
              color: Colors.white,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: const TextField(
                maxLines: 1,
                //controller: TextEditingController(text: "Shampoo"),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(-12),
                  border: InputBorder.none,
                  hintText: "Shampoo",
                  hintStyle: TextStyle(color: lightGrey),
                ),
              ),
            ),
            Container(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text("Category",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.grey)),
            ),
            Container(
                color: Colors.white,
                height: 40,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text("Select category",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: lightGrey)),
                    const Spacer(),
                    const Icon(Icons.chevron_right,
                        size: 20, color: primaryColor)
                  ],
                )),
            Container(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                "Rating",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.grey),
              ),
            ),
            Container(
              height: 40,
              color: Colors.white,
              //alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {
                        myRating = v;
                        setState(() {});
                      },
                      starCount: 5,
                      rating: myRating,
                      size: 25.0,
                      filledIconData: Icons.star,
                      //halfFilledIconData: Icons.star_half,
                      color: primaryColor,
                      borderColor: primaryColor,
                      spacing: 0.0),
                  //const Spacer(),
                  Text(
                    '${myRating.round().toString()}.0',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                "Price",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.grey),
              ),
            ),
            Container(
              height: 40,
              color: Colors.white,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Min",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.grey),
                  ),
                  Expanded(
                    child: RangeSlider(
                      values: RangeValues(_startValue, _endValue),
                      min: 0.0,
                      max: 10000.0,
                      divisions: 5,
                      labels: RangeLabels(
                        _startValue.round().toString(),
                        _endValue.round().toString(),
                      ),
                      onChanged: (values) {
                        setState(() {
                          _startValue = values.start;
                          _endValue = values.end;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveColor: lightGrey,
                    ),
                  ),
                  Text(
                    "Max",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(height: 10),
            Container(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text("Event",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.grey)),
            ),
            Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 45,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text("Deals",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Colors.grey)),
                          const Spacer(),
                          Switch(
                            value: isSwitched1,
                            onChanged: (value) {
                              setState(() {
                                isSwitched1 = value;
                              });
                            },
                            activeColor: primaryColor,
                            inactiveThumbColor: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Divider(height: 0),
                    ),
                  ],
                )),
            const Spacer(),
            //const SizedBox(height: 50,),
            Container(
              color: primaryColor,
              width: double.infinity,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                title: Text("APPLY",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
