import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Api/api_provider.dart';
import '../Navigation/Navigate.dart';
import '../Router/routes.dart';
import '../Storage/CustomStorage.dart';
import 'constants.dart';

class CommonFunction{

  void logout() async {
    final response = await ApiProvider.instance.driverLogout();
    if (response.success ?? false) {
      await Storage.instance.logout();
      Navigation.instance.navigate(Routes.loginScreen);
    } else {
      var snackBar = SnackBar(
          backgroundColor: Constants.secondaryColor,
          content: Text(
            response.message??'Something Went Wrong',
            style: Theme.of(Navigation.instance.navigatorKey.currentContext!)
                .textTheme
                .bodySmall
                ?.copyWith(
              fontSize: 17.sp,
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ));
      ScaffoldMessenger.of(Navigation.instance.navigatorKey.currentContext!)
          .showSnackBar(snackBar);
    }
  }

}