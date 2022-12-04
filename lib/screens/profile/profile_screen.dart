import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/config.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/login_response_model.dart';
import 'package:fyp_frontend/screens/profile/components/personal_information.dart';
import 'package:fyp_frontend/screens/settings/setting_screen.dart';
import 'package:fyp_frontend/services/api_service.dart';
import 'package:fyp_frontend/services/shared_service.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';

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

  late String phone;

  late String city;

  String userImage = "";

  late String joiningDate;

  late LoginResponseModel? userDetails;

  String? path;

  bool isLoading = true;

  _getUserData() async {
    print("Line 39");
    userDetails = await SharedService.loginDetails();
    userId = userDetails!.data.id;
    username = userDetails!.data.username;
    email = userDetails!.data.email;
    joiningDate = userDetails!.data.date;
    phone = userDetails!.data.phone;
    city = userDetails!.data.city;
    userImage = userDetails!.data.userImage;
    setState(() {
      isLoading = false;
    });
  }

  _updateImage() async {
    print("Line 56: In update image");
    List<Media>? res = await ImagesPicker.pick(
      count: 1,
      pickType: PickType.all,
      language: Language.System,
    );
    if (res != null) {
      print("Line 66: In update image");
      print(res[0]);
      await APIService.updateUserImage(res[0], userId).then((value) => {
            if (value != null)
              {
                _updateUserDetails(value),
                Get.snackbar(
                  "Image Updated Successfully",
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 1),
                ),
              }
            else
              {
                Get.snackbar(
                  "Image Not Updated",
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 1),
                ),
                print("Line 82: Image not updated"),
              }
          });
    }
  }

  _updateUserDetails(image) async {
    LoginResponseModel model = LoginResponseModel(
        message: "Success",
        data: Data(
            id: userId,
            username: username,
            email: email,
            phone: phone,
            city: city,
            userImage: image,
            date: joiningDate,
            token: userDetails!.data.token));
    await SharedService.setLoginDetails(model);
    setState(() {
      userDetails = model;
      userImage = image;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  )).then((value) {
                _getUserData();
              });
            },
          ),
        ],
      ),
      body: (!isLoading)
          ? Padding(
              padding: const EdgeInsets.fromLTRB(
                  defaultPadding, 0, defaultPadding, defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 70.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage: (userImage == "")
                                  ? const NetworkImage(
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
                                  : NetworkImage(Config.imgURL + userImage),
                            ),
                            Positioned(
                              bottom: -2.0,
                              right: -5.0,
                              child: IconButton(
                                  onPressed: _updateImage,
                                  icon: const Icon(
                                    CupertinoIcons.pencil_circle_fill,
                                    color: primaryColor,
                                    size: 40.0,
                                  )),
                            ),
                          ],
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
                      phone: phone,
                      city: city,
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            ),
    );
  }
}
