
import 'package:freezed_annotation/freezed_annotation.dart';

import '../Profile/profile_model.dart';

part 'profile_details.freezed.dart';
part 'profile_details.g.dart';
@freezed
class ProfileDetails with _$ProfileDetails {
  const factory ProfileDetails({
    ProfileModel? data,
    String? message,
    @Default(false) bool success,
  }) = _ProfileDetails;

  factory ProfileDetails.fromJson(Map<String, Object?> json)
  => _$ProfileDetailsFromJson(json);

  factory ProfileDetails.error(String message) => ProfileDetails(
    message: message,
  );
}