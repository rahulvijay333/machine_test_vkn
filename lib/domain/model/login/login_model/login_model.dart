import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  int? success;
  Data? data;
  @JsonKey(name: 'user_id')
  int? userId;
  String? role;
  String? message;
  dynamic error;
  String? username;

  LoginModel({
    this.success,
    this.data,
    this.userId,
    this.role,
    this.message,
    this.error,
    this.username,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
