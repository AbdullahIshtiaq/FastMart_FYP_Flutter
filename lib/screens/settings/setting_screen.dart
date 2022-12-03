import 'package:flutter/material.dart';
import 'package:fyp_frontend/screens/settings/update_profile_screen.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Divider(height: 0),
          Container(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpdateProfileScreen(),
                  ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Update Profile",
                      style: MyText.subhead(context)!.copyWith(
                          color: MyColors.grey_90,
                          fontWeight: FontWeight.bold)),
                  Text("Here update your profile information",
                      style: MyText.body1(context)!
                          .copyWith(color: Colors.grey[400])),
                  Container(height: 15)
                ],
              ),
            ),
          ),
          const Divider(height: 0),
          Container(height: 20),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Change Password",
                      style: MyText.subhead(context)!.copyWith(
                          color: MyColors.grey_90,
                          fontWeight: FontWeight.bold)),
                  Text("Here change your password",
                      style: MyText.body1(context)!
                          .copyWith(color: Colors.grey[400])),
                  Container(height: 15)
                ],
              ),
            ),
          ),
          const Divider(height: 0),
          Container(height: 20),
          Container(
            // ignore: sort_child_properties_last
            child: Text("More",
                style: MyText.subhead(context)!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text("Ask a Question",
                  style:
                      MyText.body1(context)!.copyWith(color: Colors.grey[400])),
            ),
          ),
          const Divider(height: 0),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text("F A Q",
                  style:
                      MyText.body1(context)!.copyWith(color: Colors.grey[400])),
            ),
          ),
          const Divider(height: 0),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text("Privacy Policy",
                  style:
                      MyText.body1(context)!.copyWith(color: Colors.grey[400])),
            ),
          ),
          const Divider(height: 0),
          const Spacer(),
          Center(
            child: Text("Version 1.0.0 \n All rights reserved",
                textAlign: TextAlign.center,
                style:
                    MyText.body1(context)!.copyWith(color: Colors.grey[400])),
          ),
          Center(
            child: Text("FastMart © 2022",
                style:
                    MyText.body1(context)!.copyWith(color: Colors.grey[400])),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
