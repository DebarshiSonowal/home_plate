import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'Profile/profile_model.dart';
part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({
    String? access_token,
    String? message,
    @Default(false) bool success,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, Object?> json)
  => _$TokenModelFromJson(json);
  factory TokenModel.error(String message) => TokenModel(
    message: message,
  );
}

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    ProfileModel? data,
    String? message,
    TokenModel? token,
    @Default(false) bool success,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json)
  => _$LoginModelFromJson(json);

  factory LoginModel.error(String message) => LoginModel(
    message: message,
  );
}





