// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.code,
    this.appMessage,
    this.userMessage,
    this.accessToken,
    this.notificationTimeFlag,
    this.data,
  });

  int? code;
  String? appMessage;
  String? userMessage;
  String? accessToken;
  DateTime? notificationTimeFlag;
  Data? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    code: json["code"],
    appMessage: json["app_message"],
    userMessage: json["user_message"],
    accessToken: json["access_token"],
    notificationTimeFlag: json["notificationTimeFlag"] == null ? null : DateTime.parse(json["notificationTimeFlag"]),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "app_message": appMessage,
    "user_message": userMessage,
    "access_token": accessToken,
    "notificationTimeFlag": notificationTimeFlag?.toIso8601String(),
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.image,
    this.dateOfBirth,
    this.department,
    this.designation,
    this.address,
    this.notification,
    this.userType,
    this.permissions,
  });

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? image;
  DateTime? dateOfBirth;
  Department? department;
  String? designation;
  String? address;
  int? notification;
  String? userType;
  List<String>? permissions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    image: json["image"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    department: json["department"] == null ? null : Department.fromJson(json["department"]),
    designation: json["designation"],
    address: json["address"],
    notification: json["notification"],
    userType: json["user_type"],
    permissions: json["permissions"] == null ? [] : List<String>.from(json["permissions"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "image": image,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "department": department?.toJson(),
    "designation": designation,
    "address": address,
    "notification": notification,
    "user_type": userType,
    "permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x)),
  };
}

class Department {
  Department({
    this.id,
    this.name,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? isActive;
  DateTime? createdAt;
  dynamic updatedAt;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
    isActive: json["is_active"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt,
  };
}
