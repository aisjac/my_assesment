import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LogInRequestDm {
  @JsonKey(name: 'email')
  String email = '';

  @JsonKey(name: 'password')
  String password = '';


  LogInRequestDm({required this.email, required this.password});

  LogInRequestDm.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}