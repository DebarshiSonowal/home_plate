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
