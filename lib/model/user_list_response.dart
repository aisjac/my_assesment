// To parse this JSON data, do
//
//     final userListResponse = userListResponseFromJson(jsonString);

import 'dart:convert';

UserListResponse userListResponseFromJson(String str) => UserListResponse.fromJson(json.decode(str));

String userListResponseToJson(UserListResponse data) => json.encode(data.toJson());

class UserListResponse {
  UserListResponse({
    this.code,
    this.appMessage,
    this.userMessage,
    this.data,
  });

  int? code;
  String? appMessage;
  String? userMessage;
  List<UserListData>? data;

  factory UserListResponse.fromJson(Map<String, dynamic> json) => UserListResponse(
    code: json["code"],
    appMessage: json["app_message"],
    userMessage: json["user_message"],
    data: json["data"] == null ? [] : List<UserListData>.from(json["data"]!.map((x) => UserListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "app_message": appMessage,
    "user_message": userMessage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UserListData {
  UserListData({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.department,
    this.designation,
    this.image,
    this.isApproved,
    this.isLocked,
    this.lastLoggedInformation,
    this.address,
    this.userRole,
    this.roleId,
    this.lineManager,
    this.dateOfBirth,
    this.changes,
  });

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  Department? department;
  String? designation;
  String? image;
  int? isApproved;
  int? isLocked;
  LastLoggedInformation? lastLoggedInformation;
  String? address;
  UserRole? userRole;
  int? roleId;
  LineManager? lineManager;
  String? dateOfBirth;
  int? changes;

  factory UserListData.fromJson(Map<String, dynamic> json) => UserListData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    department: json["department"] == null ? null : Department.fromJson(json["department"]),
    designation: json["designation"],
    image: json["image"],
    isApproved: json["is_approved"],
    isLocked: json["is_locked"],
    lastLoggedInformation: json["last_logged_information"] == null ? null : LastLoggedInformation.fromJson(json["last_logged_information"]),
    address: json["address"],
    userRole: userRoleValues.map[json["user_role"]]!,
    roleId: json["role_id"],
    lineManager: json["line_manager"] == null ? null : LineManager.fromJson(json["line_manager"]),
    dateOfBirth: json["date_of_birth"],
    changes: json["changes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "department": department?.toJson(),
    "designation": designation,
    "image": image,
    "is_approved": isApproved,
    "is_locked": isLocked,
    "last_logged_information": lastLoggedInformation?.toJson(),
    "address": address,
    "user_role": userRoleValues.reverse[userRole],
    "role_id": roleId,
    "line_manager": lineManager?.toJson(),
    "date_of_birth": dateOfBirth,
    "changes": changes,
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
  Name? name;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    isActive: json["is_active"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum Name { CSE, TESTER }

final nameValues = EnumValues({
  "CSE": Name.CSE,
  "tester": Name.TESTER
});

class LastLoggedInformation {
  LastLoggedInformation({
    this.id,
    this.userId,
    this.userAgent,
    this.loggedInIp,
    this.loggedInAt,
    this.loggedOutAt,
    this.loggedOutIp,
    this.loggedOutUserAgent,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? userAgent;
  String? loggedInIp;
  DateTime? loggedInAt;
  DateTime? loggedOutAt;
  String? loggedOutIp;
  String? loggedOutUserAgent;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory LastLoggedInformation.fromJson(Map<String, dynamic> json) => LastLoggedInformation(
    id: json["id"],
    userId: json["user_id"],
    userAgent: json["user_agent"],
    loggedInIp: json["logged_in_ip"],
    loggedInAt: json["logged_in_at"] == null ? null : DateTime.parse(json["logged_in_at"]),
    loggedOutAt: json["logged_out_at"] == null ? null : DateTime.parse(json["logged_out_at"]),
    loggedOutIp: json["logged_out_ip"],
    loggedOutUserAgent: json["logged_out_user_agent"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "user_agent": userAgent,
    "logged_in_ip": loggedInIp,
    "logged_in_at": loggedInAt?.toIso8601String(),
    "logged_out_at": loggedOutAt?.toIso8601String(),
    "logged_out_ip": loggedOutIp,
    "logged_out_user_agent": loggedOutUserAgent,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class LineManager {
  LineManager({
    this.id,
    this.fullName,
    this.email,
    this.dateOfBirth,
    this.phoneNumber,
    this.designation,
    this.address,
    this.departmentId,
    this.fileUrl,
    this.emailVerifiedAt,
    this.isApproved,
    this.approvedBy,
    this.manageBy,
    this.isLogged,
    this.lastLoggedInformation,
    this.isLocked,
    this.wrongAttempt,
    this.updateApproved,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? fullName;
  String? email;
  DateTime? dateOfBirth;
  String? phoneNumber;
  String? designation;
  String? address;
  int? departmentId;
  String? fileUrl;
  DateTime? emailVerifiedAt;
  int? isApproved;
  int? approvedBy;
  dynamic manageBy;
  int? isLogged;
  dynamic lastLoggedInformation;
  int? isLocked;
  int? wrongAttempt;
  int? updateApproved;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory LineManager.fromJson(Map<String, dynamic> json) => LineManager(
    id: json["id"],
    fullName: json["full_name"],
    email: json["email"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    phoneNumber: json["phone_number"],
    designation: json["designation"],
    address: json["address"],
    departmentId: json["department_id"],
    fileUrl: json["file_url"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
    isApproved: json["is_approved"],
    approvedBy: json["approved_by"],
    manageBy: json["manage_by"],
    isLogged: json["is_logged"],
    lastLoggedInformation: json["last_logged_information"],
    isLocked: json["is_locked"],
    wrongAttempt: json["wrong_attempt"],
    updateApproved: json["update_approved"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "email": email,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "phone_number": phoneNumber,
    "designation": designation,
    "address": address,
    "department_id": departmentId,
    "file_url": fileUrl,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "is_approved": isApproved,
    "approved_by": approvedBy,
    "manage_by": manageBy,
    "is_logged": isLogged,
    "last_logged_information": lastLoggedInformation,
    "is_locked": isLocked,
    "wrong_attempt": wrongAttempt,
    "update_approved": updateApproved,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum UserRole { MANAGER }

final userRoleValues = EnumValues({
  "Manager": UserRole.MANAGER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
