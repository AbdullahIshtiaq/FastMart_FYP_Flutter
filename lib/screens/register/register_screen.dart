import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/screens/register/login_screen.dart';
import '../../models/register_request_model.dart';
import '../../services/api_service.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(30)),
  borderSide: BorderSide.none,
);

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? checkBoxState = false;

  final _registrationFormKey = GlobalKey<FormState>();

  final myNameController = TextEditingController();
  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();
  final myPhoneController = TextEditingController();
  final myCityController = TextEditingController();

  bool isAPICalled = false;

  bool isValidate() {
    if (_registrationFormKey.currentState!.validate() &&
        checkBoxState == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return primaryColor;
      }
      return primaryColor;
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(defaultPadding * 2,
                defaultPadding, defaultPadding * 2, defaultPadding),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/app_icon.png'),
                ),
                const SizedBox(height: defaultPadding),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: defaultPadding),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Form(
                    key: _registrationFormKey,
                    child: Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 65,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(defaultBorderRadius)),
                              boxShadow: myBoxShadow,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return 'Name required';
                                }
                              },
                              controller: myNameController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Name",
                                border: outlineInputBorder,
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: outlineInputBorder,
                                focusedBorder: outlineInputBorder,
                                errorBorder: outlineInputBorder,
                                prefixIcon: Icon(
                                  CupertinoIcons.person_fill,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 65,
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
                            height: 65,
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
                              obscureText: true,
                              controller: myPasswordController,
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
                          Container(
                            height: 65,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(defaultBorderRadius)),
                              boxShadow: myBoxShadow,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (isConfirmPasswordValid(value!)) {
                                  return null;
                                } else {
                                  return 'Passwords not matched';
                                }
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Confirm Password",
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
                          Container(
                            height: 65,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(defaultBorderRadius)),
                              boxShadow: myBoxShadow,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  if (isPhoneValid(value)) {
                                    return null;
                                  } else {
                                    return 'Enter a valid phone number';
                                  }
                                } else {
                                  return 'Phone Number required';
                                }
                              },
                              controller: myPhoneController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Phone Number",
                                border: outlineInputBorder,
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: outlineInputBorder,
                                focusedBorder: outlineInputBorder,
                                errorBorder: outlineInputBorder,
                                prefixIcon: Icon(
                                  CupertinoIcons.phone_fill,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 65,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(defaultBorderRadius)),
                              boxShadow: myBoxShadow,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return 'City required';
                                }
                              },
                              controller: myCityController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "City",
                                border: outlineInputBorder,
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: outlineInputBorder,
                                focusedBorder: outlineInputBorder,
                                errorBorder: outlineInputBorder,
                                prefixIcon: Icon(
                                  CupertinoIcons.location_fill,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: checkBoxState,
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (value) {
                        setState(() {
                          checkBoxState = value;
                        });
                      },
                    ),
                    const Text('I accept all the '),
                    const Text(
                      'Terms & Conditions',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
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

                          RegisterRequestModel model = RegisterRequestModel(
                              username: myNameController.text,
                              email: myEmailController.text,
                              password: myPasswordController.text,
                              phone: myPhoneController.text,
                              city: myCityController.text);

                          print("In Register Screen: $model");

                          APIService.register(model).then((response) => {
                                if (response.data != null)
                                  {
                                    setState(() {
                                      isAPICalled = false;
                                    }),
                                    Get.snackbar("Registration Successful",
                                        response.message,
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: const Duration(seconds: 1)),
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const LoginScreen(),
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
                                      response.message,
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
                      child: const Text("Sign Up"),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginScreen(),
                            ),
                            (Route<dynamic> route) => false);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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

  bool isPhoneValid(String phone) {
    Pattern pattern = r'(^03[0-9]{2}[0-9]{7}$)';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(phone);
  }

  bool isPasswordValid(String password) =>
      myPasswordController.text.length == 6;

  bool isConfirmPasswordValid(String confirmPassword) {
    if (confirmPassword == myPasswordController.text) {
      return true;
    } else {
      return false;
    }
  }
}
