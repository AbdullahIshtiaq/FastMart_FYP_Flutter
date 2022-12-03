import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/services/api_service.dart';
import 'package:get/get.dart';

import '../../models/login_response_model.dart';
import '../../services/shared_service.dart';
import '../demand/components/create_demand_screen.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _updateFormKey = GlobalKey<FormState>();
  LoginResponseModel? userDetails;

  bool isUpdating = false;

  final myNameController = TextEditingController();
  final myEmailController = TextEditingController();
  final myPhoneController = TextEditingController();
  final myCityController = TextEditingController();

  getUserDetails() async {
    userDetails = await SharedService.loginDetails();
    setState(() {
      myNameController.text = userDetails!.data.username;
      myEmailController.text = userDetails!.data.email;
      myPhoneController.text = userDetails!.data.phone;
      myCityController.text = userDetails!.data.city;
    });
  }

  bool isValidate() {
    if (_updateFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  updateUserData() async {
    LoginResponseModel loginResponseModel = LoginResponseModel(
        message: "Success",
        data: Data(
          id: userDetails!.data.id,
          username: myNameController.text,
          email: myEmailController.text,
          phone: myPhoneController.text,
          city: myCityController.text,
          token: userDetails!.data.token,
          userImage: userDetails!.data.userImage,
          date: userDetails!.data.date,
        ));
    await SharedService.setLoginDetails(loginResponseModel);
    print("In Line 64: User info updated");
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Update Profile",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: (userDetails != null)
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                padding: const EdgeInsets.all(defaultPadding),
                child: Form(
                  key: _updateFormKey,
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: defaultPadding),
                        Container(
                          width: double.infinity,
                          height: 65,
                          decoration: const BoxDecoration(
                            color: lightGray1,
                            borderRadius: BorderRadius.all(
                                Radius.circular(defaultBorderRadius)),
                            boxShadow: myBoxShadow,
                          ),
                          child: TextFormField(
                            minLines: 1,
                            controller: myNameController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return 'Username required';
                              }
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: lightGray1,
                              border: outlineInputBorder,
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              errorBorder: outlineInputBorder,
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        Text(
                          "Email",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: defaultPadding),
                        Container(
                          width: double.infinity,
                          height: 65,
                          decoration: const BoxDecoration(
                            color: lightGray1,
                            borderRadius: BorderRadius.all(
                                Radius.circular(defaultBorderRadius)),
                            boxShadow: myBoxShadow,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            controller: myEmailController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (isEmailValid(value)) {
                                  return null;
                                } else {
                                  return 'Invalid email';
                                }
                              } else {
                                return 'Email required';
                              }
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: lightGray1,
                              border: outlineInputBorder,
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              errorBorder: outlineInputBorder,
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        Text(
                          "Phone",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: defaultPadding),
                        Container(
                          width: double.infinity,
                          height: 65,
                          decoration: const BoxDecoration(
                            color: lightGray1,
                            borderRadius: BorderRadius.all(
                                Radius.circular(defaultBorderRadius)),
                            boxShadow: myBoxShadow,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            controller: myPhoneController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (isPhoneValid(value)) {
                                  return null;
                                } else {
                                  return 'Invalid Phone Number';
                                }
                              } else {
                                return 'Phone required';
                              }
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: lightGray1,
                              border: outlineInputBorder,
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              errorBorder: outlineInputBorder,
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        Text(
                          "City",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: defaultPadding),
                        Container(
                          width: double.infinity,
                          height: 65,
                          decoration: const BoxDecoration(
                            color: lightGray1,
                            borderRadius: BorderRadius.all(
                                Radius.circular(defaultBorderRadius)),
                            boxShadow: myBoxShadow,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            controller: myCityController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return 'City required';
                              }
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: lightGray1,
                              border: outlineInputBorder,
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              errorBorder: outlineInputBorder,
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding * 2),
                        Center(
                          child: SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (isValidate() && isUpdating == false) {
                                  setState(() {
                                    isUpdating = true;
                                  });

                                  var model = {
                                    "id": userDetails!.data.id,
                                    "name": myNameController.text,
                                    "email": myEmailController.text,
                                    "phone": myPhoneController.text,
                                    "city": myCityController.text,
                                  };

                                  APIService.updateUserProfile(model)
                                      .then((response) {
                                    if (response == true) {
                                      //print("Line 269: ${response}");
                                      updateUserData();
                                      setState(() {
                                        isUpdating = false;
                                      });
                                      Get.snackbar(
                                        "Profile Updated",
                                        "Profile Updated Successfully",
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: const Duration(seconds: 1),
                                      );
                                    } else {
                                      setState(() {
                                        isUpdating = false;
                                      });
                                      Get.snackbar(
                                        "Profile Update Failed",
                                        "",
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: const Duration(seconds: 1),
                                      );
                                    }
                                  });
                                } else {
                                  setState(() {
                                    isUpdating = false;
                                  });
                                  Get.snackbar(
                                    "Wrong Information",
                                    "Please fill all the fields",
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 1),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: const StadiumBorder()),
                              child: const Text("Update"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
              color: primaryColor,
            )),
    );
  }

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  bool isPhoneValid(String phone) {
    Pattern pattern = r'(^03[0-9]{2}[0-9]{7}$)';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(phone);
  }
}
