import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_frontend/constants.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched1 = true, isSwitched2 = true;
    bool isSwitched3 = true, isSwitched4 = true;
    bool isSwitched5 = false, isSwitched6 = false;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  children: <Widget>[
                    Text("Select Language",
                        style: MyText.subhead(context)!.copyWith(
                            color: MyColors.grey_90,
                            fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text("English, US",
                        style: MyText.subhead(context)!
                            .copyWith(color: primaryColor)),
                    Container(width: 10)
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Real Time Mode",
                            style: MyText.subhead(context)!.copyWith(
                                color: MyColors.grey_90,
                                fontWeight: FontWeight.bold)),
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
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam efficitur ipsum in placerat molestie.  Fusce quis mauris a enim sollicitudin"
                        "\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam efficitur ipsum in placerat molestie.  Fusce quis mauris a enim sollicitudin",
                        style: MyText.body1(context)!
                            .copyWith(color: Colors.grey[400])),
                    Container(height: 15)
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Game Sound",
                            style: MyText.subhead(context)!.copyWith(
                                color: MyColors.grey_90,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Switch(
                          value: isSwitched2,
                          onChanged: (value) {
                            setState(() {
                              isSwitched2 = value;
                            });
                          },
                          activeColor: primaryColor,
                          inactiveThumbColor: Colors.grey,
                        )
                      ],
                    ),
                    Text("Sound during gameplay",
                        style: MyText.body1(context)!
                            .copyWith(color: Colors.grey[400])),
                    Container(height: 15)
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            Container(height: 25),
            Container(
              child: Text("Push Notification",
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Text("Recommended tournaments",
                        style: MyText.body1(context)!
                            .copyWith(color: Colors.grey[400])),
                    const Spacer(),
                    Switch(
                      value: isSwitched3,
                      onChanged: (value) {
                        setState(() {
                          isSwitched3 = value;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveThumbColor: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Text("New Deals & Rewards",
                        style: MyText.body1(context)!
                            .copyWith(color: Colors.grey[400])),
                    const Spacer(),
                    Switch(
                      value: isSwitched4,
                      onChanged: (value) {
                        setState(() {
                          isSwitched4 = value;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveThumbColor: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Text("Occasional promo",
                        style: MyText.body1(context)!
                            .copyWith(color: Colors.grey[400])),
                    const Spacer(),
                    Switch(
                      value: isSwitched5,
                      onChanged: (value) {
                        setState(() {
                          isSwitched5 = value;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveThumbColor: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Text("Event & Match",
                        style: MyText.body1(context)!
                            .copyWith(color: Colors.grey[400])),
                    const Spacer(),
                    Switch(
                      value: isSwitched6,
                      onChanged: (value) {
                        setState(() {
                          isSwitched6 = value;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveThumbColor: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            Container(height: 25),
            Container(
              child: Text("More",
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Text("Ask a Question",
                    style: MyText.body1(context)!
                        .copyWith(color: Colors.grey[400])),
              ),
            ),
            const Divider(height: 0),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Text("F A Q",
                    style: MyText.body1(context)!
                        .copyWith(color: Colors.grey[400])),
              ),
            ),
            const Divider(height: 0),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Text("Privacy Policy",
                    style: MyText.body1(context)!
                        .copyWith(color: Colors.grey[400])),
              ),
            ),
            const Divider(height: 0),
            Container(height: 15),
          ],
        ),
      ),
    );
  }
}
