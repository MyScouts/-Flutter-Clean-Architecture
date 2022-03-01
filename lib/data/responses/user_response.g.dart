// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['uid'] as String?,
      json['disabled'] as bool?,
      json['name'] as String?,
      json['proId'] as String?,
      json['provider'] as String?,
      json['tn'] as String?,
      json['tn_160x160'] as String?,
      json['tn_320x320'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'disabled': instance.disabled,
      'name': instance.name,
      'proId': instance.proId,
      'provider': instance.provider,
      'tn': instance.tn,
      'tn_160x160': instance.tn160,
      'tn_320x320': instance.tn320,
    };
