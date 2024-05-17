// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      firstName: json['firstName'] as String? ?? "",
      lastName: json['lastName'] as String? ?? "",
      email: json['email'] as String? ?? "",
      mobileNo: json['mobileNo'] as String? ?? "",
      are_you_a: json['are_you_a'] as String? ?? "",
      full_address: json['full_address'] as String? ?? "",
      latitude: json['latitude'] as String? ?? "",
      longitude: json['longitude'] as String? ?? "",
      province: json['province'] as String? ?? "",
      address_proof: json['address_proof'] as String? ?? "",
      gst_no: json['gst_no'] as String? ?? "",
      qst_no: json['qst_no'] as String? ?? "",
      gst_image: json['gst_image'] as String? ?? "",
      qst_image: json['qst_image'] as String? ?? "",
      driving_licence_no: json['driving_licence_no'] as String? ?? "",
      driving_licence_proof: json['driving_licence_proof'] as String? ?? "",
      taxation_proof: json['taxation_proof'] as String? ?? "",
      criminal_report: json['criminal_report'] as String? ?? "",
      account_number: json['account_number'] as String? ?? "",
      institution_number: json['institution_number'] as String? ?? "",
      id: json['id'] as int? ?? 0,
      is_email_verified: json['is_email_verified'] as int? ?? 0,
      status: json['status'] as int? ?? 0,
      availability: json['availability'] as int? ?? 0,
      is_personal_details_completed:
          json['is_personal_details_completed'] as int? ?? 0,
      is_driving_license_document_completed:
          json['is_driving_license_document_completed'] as int? ?? 0,
      is_address_proof_document_completed:
          json['is_address_proof_document_completed'] as int? ?? 0,
      is_tax_document_completed: json['is_tax_document_completed'] as int? ?? 0,
      is_bank_document_detail: json['is_bank_document_detail'] as int? ?? 0,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobileNo': instance.mobileNo,
      'are_you_a': instance.are_you_a,
      'full_address': instance.full_address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'province': instance.province,
      'address_proof': instance.address_proof,
      'gst_no': instance.gst_no,
      'qst_no': instance.qst_no,
      'gst_image': instance.gst_image,
      'qst_image': instance.qst_image,
      'driving_licence_no': instance.driving_licence_no,
      'driving_licence_proof': instance.driving_licence_proof,
      'taxation_proof': instance.taxation_proof,
      'criminal_report': instance.criminal_report,
      'account_number': instance.account_number,
      'institution_number': instance.institution_number,
      'id': instance.id,
      'is_email_verified': instance.is_email_verified,
      'status': instance.status,
      'availability': instance.availability,
      'is_personal_details_completed': instance.is_personal_details_completed,
      'is_driving_license_document_completed':
          instance.is_driving_license_document_completed,
      'is_address_proof_document_completed':
          instance.is_address_proof_document_completed,
      'is_tax_document_completed': instance.is_tax_document_completed,
      'is_bank_document_detail': instance.is_bank_document_detail,
    };
