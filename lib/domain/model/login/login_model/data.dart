import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? refresh;
  String? access;
  @JsonKey(name: 'user_id')
  int? userId;
  String? role;
  String? username;
  String? email;
  @JsonKey(name: 'last_login')
  String? lastLogin;

  Data({
    this.refresh,
    this.access,
    this.userId,
    this.role,
    this.username,
    this.email,
    this.lastLogin,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
