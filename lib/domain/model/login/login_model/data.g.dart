// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      userId: json['user_id'] as int?,
      role: json['role'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      lastLogin: json['last_login'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
      'user_id': instance.userId,
      'role': instance.role,
      'username': instance.username,
      'email': instance.email,
      'last_login': instance.lastLogin,
    };
