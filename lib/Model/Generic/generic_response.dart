

//['message' => ("A OTP has been sent to your " .
// ($req->mobile ? "mobile no. +1 " . $req->mobile : "account")),
// "otp" => $otp, "success" => true

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_response.freezed.dart';
part 'generic_response.g.dart';

@freezed
class GenericResponse with _$GenericResponse {
  const factory GenericResponse({
    String? message,
    @Default(false) bool success,
  }) = _GenericResponse;

  factory GenericResponse.fromJson(Map<String, Object?> json)
  => _$GenericResponseFromJson(json);

  factory GenericResponse.error(String message) => GenericResponse(
    message: message,
  );
}



