import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/keep/v1.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Constants/assets.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:home_plate/Storage/CustomStorage.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/constants.dart';

class VerificationPendingScreen extends StatefulWidget {
  const VerificationPendingScreen({super.key});

  @override
  State<VerificationPendingScreen> createState() =>
      _VerificationPendingScreenState();
}

class _VerificationPendingScreenState extends State<VerificationPendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        centerTitle: true,
        title: AutoSizeText(
          "Registration Complete",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.seventhColor,
                fontSize: 18.sp,
              ),
        ),
      ),
      body: Container(
        color: Constants.bgColor,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          // horizontal: 2.w,
          bottom: 1.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 20.h,
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 1.5.h,
              ),
              color: Constants.secondaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Lottie.asset(Assets.verifying),
                  SizedBox(
                    width: 60.w,
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Your Application is under verification\n",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Constants.primaryColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          TextSpan(
                            text: "\nAccount will get activated in 48hrs",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Constants.primaryColor,
                                      fontSize: 16.sp,
                                      // fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Personal Information",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 18.sp,
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                      AutoSizeText(
                        "Approved",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.seventhColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigation.instance
                          .navigate(Routes.profileUpdatePersonalDetailsScreen);
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Constants.fourthColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Driving License",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 18.sp,
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                      AutoSizeText(
                        "Approved",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.seventhColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      // Navigation.instance
                      //     .navigate(Routes.profileVerifiedScreen);
                      Navigation.instance
                          .navigate(Routes.profileUpdateDocumentScreen);
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Constants.fourthColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Bank Details",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 18.sp,
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                      AutoSizeText(
                        "Verification Pending",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.secondaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigation.instance
                          .navigate(Routes.profileUpdateBankDetailsScreen);
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Constants.fourthColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Tax Information",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 18.sp,
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                      AutoSizeText(
                        "Approved",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.seventhColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigation.instance
                          .navigate(Routes.profileUpdateTaxDetailsScreen);
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Constants.fourthColor,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 1.w,
              ),
              height: 6.5.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {
                  // sendForFinalReview();
                  Navigation.instance.navigate(Routes.profileVerifiedScreen);
                },
                child: Text(
                  "Send for final review",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 18.sp,
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendForFinalReview() async {
    final response = await ApiProvider.instance
        .sendDriverProfileForReview(Storage.instance.token);
    if (response.success ?? false) {
      var snackBar = SnackBar(
        backgroundColor: Constants.seventhColor,
        content: Text(
          response.message ?? 'Sent for final review',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 17.sp,
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigation.instance.navigate(Routes.profileVerifiedScreen);
    } else {
      var snackBar = SnackBar(
        backgroundColor: Constants.secondaryColor,
        content: Text(
          response.message ?? 'Something went wrong',
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
}
