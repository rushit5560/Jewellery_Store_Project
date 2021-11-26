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
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}