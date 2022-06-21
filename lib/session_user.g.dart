// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionUser _$SessionUserFromJson(Map<String, dynamic> json) => SessionUser(
      id: json['id'] as int,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      fullName: json['fullName'] as String?,
    )..token = json['token'] as String?;

Map<String, dynamic> _$SessionUserToJson(SessionUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
      'token': instance.token,
    };
