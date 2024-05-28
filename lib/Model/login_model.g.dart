// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      data: json['data'] == null
          ? null
          : ProfileModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      access_token: json['access_token'] as String?,
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'access_token': instance.access_token,
      'success': instance.success,
    };
