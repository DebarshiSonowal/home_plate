import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    @Default("") String? firstName,
    @Default("") String? lastName,
    @Default("") String? email,
    @Default("") String? mobileNo,
    @Default("") String? are_you_a,
    @Default("") String? full_address,
    @Default("") String? latitude,
    @Default("") String? longitude,
    @Default("") String? province,
    @Default("") String? address_proof,
    @Default("") String? gst_no,
    @Default("") String? qst_no,
    @Default("") String? gst_image,
    @Default("") String? qst_image,
    @Default("") String? driving_licence_no,
    @Default("") String? driving_licence_proof,
    @Default("") String? taxation_proof,
    @Default("") String? criminal_report,
    @Default("") String? account_number,
    @Default("") String? institution_number,
    @Default("") String? postal_code,
    @Default("") String? profile_pic,
    @Default("") String? city,
    @Default("") String? bank_name,
    @Default("") String? transit_number,
    @Default("") String? resetToken,
    @Default(0) int? id,
    @Default(0) int? is_email_verified,
    @Default(0) int? status,
    @Default(0) int? availability,
    @Default(0) int? is_personal_details_completed,
    @Default(0) int? is_driving_license_document_completed,
    @Default(0) int? is_address_proof_document_completed,
    @Default(0) int? is_tax_document_completed,
    @Default(0) int? is_bank_document_detail,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) =>
      _$ProfileModelFromJson(json);
}