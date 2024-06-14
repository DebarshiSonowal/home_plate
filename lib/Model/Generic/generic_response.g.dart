// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericResponseImpl _$$GenericResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$$GenericResponseImplToJson(
        _$GenericResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };

_$GenericResponse2Impl _$$GenericResponse2ImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericResponse2Impl(
      message: json['message'] as String?,
      code: json['code'] as int?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$$GenericResponse2ImplToJson(
        _$GenericResponse2Impl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };
