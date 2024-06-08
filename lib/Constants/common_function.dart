import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Api/api_provider.dart';
import '../CommonWidget/loading_dialog.dart';
import '../Navigation/Navigate.dart';
import '../Router/routes.dart';
import '../Storage/CustomStorage.dart';
import 'constants.dart';

class CommonFunction {
  void logout() async {
    final response = await ApiProvider.instance.driverLogout();
    if (response.success ?? false) {
      await Storage.instance.logout();
      Navigation.instance.navigate(Routes.loginScreen);
    } else {
      await Storage.instance.logout();
      Navigation.instance.navigate(Routes.loginScreen);
    }
  }

  Future<void> showLoadingDialog(context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // User cannot tap outside to dismiss
      builder: (BuildContext context) => const LoadingDialog(),
    ); // Simulate loading// Dismiss the dialog
  }

  Future<bool> hideLoadingDialog(context) async{
    Navigator.of(context).pop();
    return true;
  }

  void accountDeactivate(context) {
    var snackBar = SnackBar(
      backgroundColor: Constants.secondaryColor,
      content: Text(
        'Your account has been deactivated. Please contact our support team',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 17.sp,
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
