import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Model/Generic/generic_response.dart';
import 'package:home_plate/Model/login_model.dart';
import 'package:home_plate/Model/registration_model.dart';

import '../Model/Order/order_model.dart';
import '../Storage/CustomStorage.dart';

class ApiProvider {
  ApiProvider._();

  static final ApiProvider instance = ApiProvider._();

  final String baseUrl = "http://18.222.65.250";

  // final String baseUrl2 = "http://develop.guwahatiplus.com/api/v1";
  // final String homeUrl = "https://www.guwahatiplus.com/api/v1";
  final String path = "api";

  Dio? dio;

  Future<RegistrationModel> registration(
    String firstName,
    String lastName,
    String email,
    String mobileNo,
    String are_you_a,
    String password,
    String full_address,
    String province,
    String city,
    String postal_code,
    double latitude,
    double longitude,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/driverRegisteraion";
    dio = Dio(option);
    var data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "mobileNo": mobileNo,
      "are_you_a": are_you_a,
      "password": password,
      "full_address": full_address,
      "province": province,
      "city": city,
      "postal code": postal_code,
      "latitude": latitude,
      "longitude": longitude,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("driverRegisteraion response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return RegistrationModel.fromJson(response?.data);
      } else {
        debugPrint("driverRegisteraion  error: ${response?.data}");
        return RegistrationModel.withError(
          response?.data['message'] ??
              "Something went wrong with the registration",
          response?.data['ServiceNotAvailable'] ?? false,
        );
      }
    } on DioError catch (e) {
      debugPrint("driverRegisteraion error response: ${e.response}");
      return RegistrationModel.withError(
        e.response?.data['message'] ??
            "Something went wrong with the registration",
        e.response?.data['ServiceNotAvailable'] ?? false,
      );
    }
  }

  Future<LoginModel> login(
    String email,
    String mobileNo,
    String password,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/driverLogin";
    // http://homeplate.ca/driverLogin
    // hhtps://homeplate.ca/driverLogin
    dio = Dio(option);
    var data = {
      // "email": email,
      "userName": email.isEmpty ? mobileNo : email,
      "password": password,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("driverLogin response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return LoginModel.fromJson(response?.data);
      } else {
        debugPrint("driverLogin  error: ${response?.data}");
        return LoginModel.error(
          response?.data['message'] ??
              "Something went wrong with the registration",
        );
      }
    } on DioError catch (e) {
      debugPrint("driverLogin error response: ${e.response}");
      return LoginModel.error(
        e.response?.data['message'] ??
            "Something went wrong with the registration",
      );
    }
  }

  Future<GenericResponse> driverSendOtp(
    String mobile,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/driverSendOTP";
    // http://homeplate.ca/driverLogin
    // hhtps://homeplate.ca/driverLogin
    dio = Dio(option);
    var data = {
      "mobile": mobile,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("driverSendOTP response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("driverSendOTP  error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("driverSendOTP error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<GenericResponse> driverVerifyOtp(String mobile, otp) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/verifyOtp";
    dio = Dio(option);
    var data = {
      "mobile": mobile,
      "otp": otp,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("driverVerifyOTP response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("driverVerifyOTP  error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("driverVerifyOTP error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<GenericResponse> driverForgetPassword(
      String userName, password, confirm_password) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/driverForgetPassword";
    dio = Dio(option);
    var data = {
      "userName": userName,
      "password": password,
      "confirm_password": confirm_password,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("driverForgetPassword response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("driverForgetPassword  error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("driverForgetPassword error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<GenericResponse> updatePersonalDetails(
    String driver_id,
    String firstName,
    String lastName,
    String full_address,
    String province,
    String city,
    String postal_code,
    String lat,
    String long,
    String address_proof,
    String profile_pic,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/updatePersonalDetails";
    dio = Dio(option);
    FormData data = FormData.fromMap({
      "driver_id": driver_id,
      "firstName": firstName,
      "lastName": lastName,
      "full_address": full_address,
      "province": province,
      "city": city,
      "postal_code": postal_code,
      "lat": lat,
      "long": long,
      "address_proof": await MultipartFile.fromFile(
        address_proof,
        filename: address_proof.split("/").last.split(".").first,
      ),
      "profile_pic": await MultipartFile.fromFile(
        profile_pic,
        filename: profile_pic.split("/").last.split(".").first,
      ),
    });
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("updatePersonalDetails response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("updatePersonalDetails error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("updatePersonalDetails error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<GenericResponse> updateDrivingLicence(
    String id,
    String driving_licence_number,
    String driving_licence_proof,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/updateDrivingLicence";
    dio = Dio(option);
    FormData data = FormData.fromMap({
      "id": id,
      "driving_licence_number": driving_licence_number,
      "driving_licence_proof": await MultipartFile.fromFile(
        driving_licence_proof,
        filename: driving_licence_number,
      ),
    });
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("updateDrivingLicence response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("updateDrivingLicence error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("updateDrivingLicence error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<GenericResponse> updateTaxationNo(
    String id,
    String gst_image,
    String qst_image,
    String gst_no,
    String qst_no,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/updateTaxationNo";
    dio = Dio(option);
    FormData data = FormData.fromMap({
      "id": id,
      "gst_no": gst_no,
      "gst_image": await MultipartFile.fromFile(
        gst_image,
        filename: gst_no,
      ),
      "qst_no": qst_no,
      "qst_image": await MultipartFile.fromFile(
        qst_image,
        filename: qst_no,
      ),
    });
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("updateTaxationNo response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("updateTaxationNo error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("updateTaxationNo error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<GenericResponse> updateCriminialReport(
      String id, criminal_report) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/updateCriminialReport";
    dio = Dio(option);
    var data = {
      "id": id,
      "criminal_report": criminal_report,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("updateCriminialReport response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("updateCriminialReport  error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("updateCriminialReport error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<LoginModel> getMyDetails(
    String driver_id,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/getMyDetails";
    // http://homeplate.ca/driverLogin
    // hhtps://homeplate.ca/driverLogin
    dio = Dio(option);
    var data = {
      "driver_id": driver_id,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("getMyDetails response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return LoginModel.fromJson(response?.data);
      } else {
        debugPrint("getMyDetails error: ${response?.data}");
        return LoginModel.error(
          response?.data['message'] ??
              "Something went wrong with the registration",
        );
      }
    } on DioError catch (e) {
      debugPrint("getMyDetails error response: ${e.response}");
      return LoginModel.error(
        e.response?.data['message'] ??
            "Something went wrong with the registration",
      );
    }
  }

  Future<GenericResponse> driverUpdateEmail(
    String driver_id,
    String email,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/driverUpdateEmail";
    dio = Dio(option);
    var data = {
      "driver_id": driver_id,
      "email": email,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("driverUpdateEmail response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("driverUpdateEmail error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("driverUpdateEmail error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<GenericResponse> VerifyDriverEmail(
    String driver_id,
    String email,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/VerifyDriverEmail";
    dio = Dio(option);
    var data = {
      "driver_id": driver_id,
      "email": email,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("VerifyDriverEmail response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("VerifyDriverEmail  error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("VerifyDriverEmail error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<GenericResponse> updateDriverBankDetails(
    String id,
    String bank_name,
    String transit_number,
    String account_number,
    String institution_number,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/updateDriverBankDetails";
    dio = Dio(option);
    var data = {
      "id": id,
      "bank_name": bank_name,
      "transit_number": transit_number,
      "account_number": account_number,
      "institution_number": institution_number,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("updateDriverBankDetails response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("uupdateDriverBankDetails error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("updateDriverBankDetails error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<GenericResponse> sendDriverProfileForReview(
    String driver_id,
  ) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/sendDriverProfileForReview";
    dio = Dio(option);
    var data = {
      "driver_id": driver_id,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("sendDriverProfileForReview response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("sendDriverProfileForReview error: ${response?.data}");
        return GenericResponse.error(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint("sendDriverProfileForReview error response: ${e.response}");
      return GenericResponse.error(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }

  Future<OrderResponse> updateLatLongAndGetListOfOrdersForDriver(
      String driver_id, latitude, longitude) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/updateLatLongAndGetListOfOrdersForDriver";
    dio = Dio(option);
    var data = {
      "driver_id": driver_id,
      "latitude": latitude,
      "longitude": longitude,
    };
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));
    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint(
          "updateLatLongAndGetListOfOrdersForDriver response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return OrderResponse.fromJson(response?.data);
      } else {
        debugPrint(
            "updateLatLongAndGetListOfOrdersForDriver error: ${response?.data}");
        return OrderResponse.withError(
          response?.data['message'] ?? "Something went wrong",
        );
      }
    } on DioError catch (e) {
      debugPrint(
          "updateLatLongAndGetListOfOrdersForDriver error response: ${e.response}");
      return OrderResponse.withError(
        e.response?.data['message'] ?? "Something went wrong",
      );
    }
  }
}
