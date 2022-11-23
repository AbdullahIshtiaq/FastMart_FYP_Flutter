import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/login_response_model.dart';
import 'package:fyp_frontend/screens/profile/components/personal_information.dart';
import 'package:fyp_frontend/screens/settings/setting_screen.dart';
import 'package:fyp_frontend/services/shared_service.dart';

import 'components/profile_options.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String userId;

  late String username;

  late String email;

  late String joiningDate;

  late LoginResponseModel? userDetails;

  bool isLoading = true;

  Future<LoginResponseModel?> _getUserData() async {
    print("Line 27");
    userDetails = await SharedService.loginDetails();
    userId = userDetails!.data.id;
    username = userDetails!.data.username;
    email = userDetails!.data.email;
    joiningDate = userDetails!.data.date;
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getUserData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print("Line 47");

          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                // leading: const BackButton(color: Colors.black),
                title: Text(
                  "Profile",
                  style: Theme.of(context).textTheme.headline6,
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.login,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      SharedService.logout(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingScreen(),
                          ));
                    },
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 100.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/images/abdullah.png'),
                          ),
                          const SizedBox(height: defaultPadding),
                          Text(
                            username,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: defaultPadding / 4),
                          Text(
                            email,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    ProfileOptions(
                      userDetails: userDetails!,
                    ),
                    const SizedBox(height: defaultPadding),
                    Text(
                      "Personal Information",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: defaultPadding),
                    Expanded(
                      child: PersonalInfo(
                        username: username,
                        email: email,
                        joiningDate: joiningDate,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
        });
  }
}
