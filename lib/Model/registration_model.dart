class RegistrationModel {
  //{
  //     "message": "we are not offering our services in this region",
  //     "ServiceNotAvailable": true,
  //     "success": false
  // }
  String? message;
  bool? success, ServiceNotAvailable;

  RegistrationModel.fromJson(json) {
    success = json["success"] ?? false;
    message = json["message"] ?? "Something went wrong with your registration";
    ServiceNotAvailable = json["ServiceNotAvailable"] ?? false;
  }

  RegistrationModel.withError(msg,val) {
    success = false;
    message = msg;
    ServiceNotAvailable=val;
  }
}
