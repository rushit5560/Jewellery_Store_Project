// import 'dart:convert';
//
// UpdateUserProfileData updateUserProfileDataFromJson(String str) => UpdateUserProfileData.fromJson(json.decode(str));
//
// String updateUserProfileDataToJson(UpdateUserProfileData data) => json.encode(data.toJson());
//
// class UpdateUserProfileData {
//   UpdateUserProfileData({
//     required this.success,
//     required this.message,
//   });
//
//   bool success;
//   String message;
//
//   factory UpdateUserProfileData.fromJson(Map<String, dynamic> json) => UpdateUserProfileData(
//     success: json["success"],
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//   };
// }

// To parse this JSON data, do
//
//     final updateUserProfileData = updateUserProfileDataFromJson(jsonString);

import 'dart:convert';

UpdateUserProfileData updateUserProfileDataFromJson(String str) => UpdateUserProfileData.fromJson(json.decode(str));

String updateUserProfileDataToJson(UpdateUserProfileData data) => json.encode(data.toJson());

class UpdateUserProfileData {
  UpdateUserProfileData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory UpdateUserProfileData.fromJson(Map<String, dynamic> json) => UpdateUserProfileData(
    success: json["success"] == null ? false : json["success"],
    message: json["message"] == null ? "" : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success ? false : success,
    "message": message.isEmpty ? "" : message,
  };
}
