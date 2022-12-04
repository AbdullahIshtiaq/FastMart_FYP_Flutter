import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/login_request_model.dart';
import 'package:fyp_frontend/screens/register/register_screen.dart';
import 'package:fyp_frontend/services/api_service.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();

  bool isAPICalled = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(defaultPadding * 2,
              defaultPadding * 2, defaultPadding * 2, defaultPadding * 2),
          child: Column(
            children: [
              const SizedBox(height: defaultPadding * 4),
              const CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/app_icon.png'),
              ),
              const SizedBox(height: defaultPadding * 2),
              const Text(
                "Log in",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(defaultBorderRadius)),
                          boxShadow: myBoxShadow,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (isEmailValid(value)) {
                                return null;
                              } else {
                                return 'Invalid Email';
                              }
                            } else {
                              return 'Email Required';
                            }
                          },
                          controller: myEmailController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email",
                            border: outlineInputBorder,
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: outlineInputBorder,
                            focusedBorder: outlineInputBorder,
                            errorBorder: outlineInputBorder,
                            prefixIcon: Icon(
                              CupertinoIcons.mail_solid,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(defaultBorderRadius)),
                          boxShadow: myBoxShadow,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (isPasswordValid(value)) {
                                return null;
                              } else {
                                return 'Password length must be 6 digits';
                              }
                            } else {
                              return 'Password Required';
                            }
                          },
                          controller: myPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            border: outlineInputBorder,
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: outlineInputBorder,
                            focusedBorder: outlineInputBorder,
                            errorBorder: outlineInputBorder,
                            prefixIcon: Icon(
                              CupertinoIcons.lock_fill,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isValidate() && !isAPICalled) {
                        setState(() {
                          isAPICalled = true;
                        });

                        LoginRequestModel model = LoginRequestModel(
                            email: myEmailController.text,
                            password: myPasswordController.text);

                        APIService.login(model).then((response) => {
                              if (response)
                                {
                                  FirebaseMessaging.instance
                                      .getToken()
                                      .then((value) {
                                    APIService.updateUserToken(value)
                                        .then((response) {
                                      if (response!) {
                                        print("Token updated");
                                      } else {
                                        print("Token update failed");
                                      }
                                    });
                                  }),
                                  setState(() {
                                    isAPICalled = false;
                                  }),
                                  Get.snackbar("Login Successful", "$response",
                                      snackPosition: SnackPosition.BOTTOM,
                                      duration: const Duration(seconds: 1)),
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const MainScreen(),
                                      ),
                                      (Route<dynamic> route) => false)
                                }
                              else
                                {
                                  setState(() {
                                    isAPICalled = false;
                                  }),
                                  Get.snackbar(
                                    "Wrong Credentials",
                                    "$response",
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 1),
                                  )
                                }
                            });
                      } else {
                        setState(() {
                          isAPICalled = false;
                        });

                        Get.snackbar(
                          "Wrong Credentials",
                          "Please enter valid credentials",
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 1),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: const StadiumBorder()),
                    child: const Text("Log in"),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont have an account? '),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const RegisterScreen(),
                          ),
                          (Route<dynamic> route) => false);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return myPasswordController.text.length == 6;
  }

  bool isValidate() {
    if (_loginFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
