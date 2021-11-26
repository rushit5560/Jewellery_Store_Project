import 'dart:convert';

ChangePasswordData changePasswordDataFromJson(String str) => ChangePasswordData.fromJson(json.decode(str));

String changePasswordDataToJson(ChangePasswordData data) => json.encode(data.toJson());

class ChangePasswordData {
  ChangePasswordData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory ChangePasswordData.fromJson(Map<String, dynamic> json) => ChangePasswordData(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.password,
    required this.rememberToken,
    this.image,
    required this.country,
    required this.state,
    required this.city,
    this.forgotpasswordToken,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String password;
  String rememberToken;
  dynamic image;
  int country;
  int state;
  int city;
  dynamic forgotpasswordToken;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"],
    rememberToken: json["remember_token"],
    image: json["image"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    forgotpasswordToken: json["forgotpassword_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "remember_token": rememberToken,
    "image": image,
    "country": country,
    "state": state,
    "city": city,
    "forgotpassword_token": forgotpasswordToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
