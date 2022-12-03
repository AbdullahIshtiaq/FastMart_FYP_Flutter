// import 'dart:convert';
// import 'package:fyp_frontend/services/shared_service.dart';
// import 'package:get/get.dart';

// User userModel(String str) => User.fromJson(json.decode(str));

// class User {
//   User({
//     required this.username,
//     required this.email,
//     required this.date,
//     required this.phone,
//     required this.city,
//     required this.userImage,
//     required this.id,
//     required this.token,
//   });

//   late final String username;
//   late final String email;
//   late final String date;
//   late final String id;
//   late final String token;
//   late final String phone;
//   late final String city;
//   late final String userImage;

//   User.fromJson(Map<String, dynamic> json) {
//     username = json['username'];
//     email = json['email'];
//     date = json['date'];
//     id = json['id'];
//     token = json['token'];
//     phone = json['phone'];
//     city = json['city'];
//     userImage = json['userImage'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['username'] = username;
//     _data['email'] = email;
//     _data['date'] = date;
//     _data['id'] = id;
//     _data['token'] = token;
//     _data['phone'] = phone;
//     _data['city'] = city;
//     _data['userImage'] = userImage;
//     return _data;
//   }
// }

// class UserController extends GetxController {
//   var user = User(
//           username: '',
//           email: '',
//           date: '',
//           phone: '',
//           city: '',
//           userImage: '',
//           id: '',
//           token: '')
//       .obs;

//   @override
//   void onInit() {
//     // SharedService.loginDetails().then((value) {
//     //   if (value != null) {
//     //     user.value = value;
//     //   }
//     // });
//     super.onInit();
//   }

//   void setUser(User user) {
//     this.user = user as Rx<User>;
//     update();
//   }

//   get getUser => user;
// }
