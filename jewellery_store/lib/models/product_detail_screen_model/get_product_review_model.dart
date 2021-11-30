// To parse this JSON data, do
//
//     final productReviewData = productReviewDataFromJson(jsonString);

import 'dart:convert';

ProductReviewData productReviewDataFromJson(String str) => ProductReviewData.fromJson(json.decode(str));

String productReviewDataToJson(ProductReviewData data) => json.encode(data.toJson());

class ProductReviewData {
  ProductReviewData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum1> data;

  factory ProductReviewData.fromJson(Map<String, dynamic> json) => ProductReviewData(
    success: json["success"],
    message: json["message"],
    data: List<Datum1>.from(json["data"].map((x) => Datum1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum1 {
  Datum1({
    required this.id,
    required this.userid,
    required this.productId,
    required this.ratings,
    required this.comment,
    required this.isActive,
    required this.createdDate,
    required this.username,
  });

  int id;
  int userid;
  int productId;
  int ratings;
  String comment;
  int isActive;
  DateTime createdDate;
  String username;

  factory Datum1.fromJson(Map<String, dynamic> json) => Datum1(
    id: json["id"],
    userid: json["userid"],
    productId: json["product_id"],
    ratings: json["ratings"],
    comment: json["comment"],
    isActive: json["is_active"],
    createdDate: DateTime.parse(json["created_date"]),
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "product_id": productId,
    "ratings": ratings,
    "comment": comment,
    "is_active": isActive,
    "created_date": createdDate.toIso8601String(),
    "username": username,
  };
}
