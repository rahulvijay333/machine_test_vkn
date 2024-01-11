// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      success: json['success'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      userId: json['user_id'] as int?,
      role: json['role'] as String?,
      message: json['message'] as String?,
      error: json['error'],
      username: json['username'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'user_id': instance.userId,
      'role': instance.role,
      'message': instance.message,
      'error': instance.error,
      'username': instance.username,
    };
