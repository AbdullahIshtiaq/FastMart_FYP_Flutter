import 'dart:convert';

LoginResponseModel loginResponseModel(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.username,
    required this.email,
    required this.date,
    required this.phone,
    required this.city,
    required this.userImage,
    required this.id,
    required this.token,
  });
  late final String username;
  late final String email;
  late final String date;
  late final String id;
  late final String token;
  late final String phone;
  late final String city;
  late final String userImage;

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    date = json['date'];
    id = json['id'];
    token = json['token'];
    phone = json['phone'];
    city = json['city'];
    userImage = json['userImage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['date'] = date;
    _data['id'] = id;
    _data['token'] = token;
    _data['phone'] = phone;
    _data['city'] = city;
    _data['userImage'] = userImage;
    return _data;
  }
}
