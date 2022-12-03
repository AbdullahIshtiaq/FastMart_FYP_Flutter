class RegisterRequestModel {
  RegisterRequestModel({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.city,
  });
  late final String username;
  late final String email;
  late final String password;
  late final String phone;
  late final String city;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['city'] = city;
    return _data;
  }
}
