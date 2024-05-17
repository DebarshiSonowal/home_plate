import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/assets.dart';
import '../../Constants/constants.dart';
import '../../Constants/custom_shapes.dart';
import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';

enum EmployeeType { homePlate, outside }

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  EmployeeType selected = EmployeeType.homePlate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 2.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Constants.primaryColor,
        ),
        width: double.infinity,
        height: double.infinity,
        // height: 40.h,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60.w,
                child: Image.asset(
                  Assets.logo,
                  // color: Colors.white,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Card(
                color: Constants.bgColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.5.h,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 80.w,
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Welcome to Homeplate\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Constants.secondaryColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: "Register as Driver",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Constants.fourthColor,
                                      fontSize: 16.sp,
                                      // fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: EmployeeType.homePlate,
                            groupValue: selected,
                            onChanged: (val) {
                              setState(() {
                                selected = val!;
                              });
                            },
                          ),
                          Text(
                            "Working for Homeplate",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Constants.fourthColor,
                                      fontSize: 18.sp,
                                    ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: EmployeeType.outside,
                            groupValue: selected,
                            onChanged: (val) {
                              setState(() {
                                selected = val!;
                              });
                            },
                          ),
                          Text(
                            "Outside",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Constants.fourthColor,
                                      fontSize: 18.sp,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 1.w,
                        ),
                        height: 6.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constants.secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            Navigation.instance.navigate(
                              Routes.signUpScreen,
                              args: selected == EmployeeType.homePlate
                                  ? "Welcome to Homeplate"
                                  : "Outside",
                            );
                          },
                          child: Text(
                            "Continue",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 17.sp,
                                      color: Constants.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        width: 75.w,
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Constants.fourthColor,
                                      fontSize: 14.sp,
                                      // fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigation.instance
                                        .navigate(Routes.loginScreen);
                                  },
                                text: "Sign In",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Constants.sixthColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
