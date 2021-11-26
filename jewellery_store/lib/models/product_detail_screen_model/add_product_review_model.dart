import 'dart:convert';

AddProductReviewData addProductReviewDataFromJson(String str) => AddProductReviewData.fromJson(json.decode(str));

String addProductReviewDataToJson(AddProductReviewData data) => json.encode(data.toJson());

class AddProductReviewData {
  AddProductReviewData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory AddProductReviewData.fromJson(Map<String, dynamic> json) => AddProductReviewData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
