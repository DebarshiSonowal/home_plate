import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Constants/assets.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/constants.dart';

class VerifiedScreen extends StatefulWidget {
  const VerifiedScreen({super.key});

  @override
  State<VerifiedScreen> createState() => _VerifiedScreenState();
}

class _VerifiedScreenState extends State<VerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        centerTitle: true,
        title: AutoSizeText(
          "Registered Successfully",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.seventhColor,
                fontSize: 18.sp,
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 2.h,
        ),
        color: Constants.bgColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50.w,
              child: Lottie.asset(
                Assets.verifying,
                fit: BoxFit.fill,
              ),
            ),
            AutoSizeText.rich(
              TextSpan(children: [
                TextSpan(
                  text: "Your Application is Verified Successfully\n",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.seventhColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ]),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            AutoSizeText.rich(
              TextSpan(
                text: "Redirecting to Login Screen",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.fourthColor,
                      fontSize: 15.sp,
                      // fontWeight: FontWeight.bold,
                    ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigation.instance.navigateAndRemoveUntil(Routes.loginScreen);
    });
  }
}
