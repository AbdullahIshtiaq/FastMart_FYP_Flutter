import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/services/api_service.dart';
import 'package:get/get.dart';

import '../../models/login_response_model.dart';
import '../../services/shared_service.dart';
import '../demand/components/create_demand_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _updateFormKey = GlobalKey<FormState>();
  LoginResponseModel? userDetails;

  bool isUpdating = false;

  final myOldPasswordController = TextEditingController();
  final myNewPasswordController = TextEditingController();
  final myConfirmPasswordController = TextEditingController();

  getUserDetails() async {
    userDetails = await SharedService.loginDetails();
    setState(() {});
  }

  bool isValidate() {
    if (_updateFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
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
          "Change Password",
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
                          "Old Password",
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
                            controller: myOldPasswordController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (isPasswordValid(value)) {
                                  return null;
                                } else {
                                  return 'Invalid password';
                                }
                              } else {
                                return 'Old password required';
                              }
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              filled: true,
                              hintText: "Enter your old password",
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
                          "New Password",
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
                            controller: myNewPasswordController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (isPasswordValid(value)) {
                                  return null;
                                } else {
                                  return 'Invalid password';
                                }
                              } else {
                                return 'New password required';
                              }
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              filled: true,
                              hintText: "Enter your new password",
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
                            controller: myConfirmPasswordController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (isConfirmPasswordValid(value)) {
                                  return null;
                                } else {
                                  return 'Password not match';
                                }
                              } else {
                                return 'Comfirm password required';
                              }
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              filled: true,
                              hintText: "Enter your confirm password",
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
                                    "userId": userDetails!.data.id,
                                    "oldPassword": myOldPasswordController.text,
                                    "newPassword": myNewPasswordController.text,
                                  };

                                  APIService.changePassword(model)
                                      .then((response) {
                                    if (response == true) {
                                      setState(() {
                                        isUpdating = false;
                                      });
                                      Get.snackbar(
                                        "Password Updated",
                                        "Password Updated Successfully",
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: const Duration(seconds: 1),
                                      );
                                    } else {
                                      setState(() {
                                        isUpdating = false;
                                      });
                                      Get.snackbar(
                                        "Password Updation Failed",
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
                              child: const Text("Change Password"),
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

  bool isPasswordValid(String password) => password.length == 6;

  bool isConfirmPasswordValid(String confirmPassword) {
    if (confirmPassword == myNewPasswordController.text) {
      return true;
    } else {
      return false;
    }
  }
}
