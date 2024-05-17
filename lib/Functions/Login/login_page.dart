import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:home_plate/Storage/CustomStorage.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/assets.dart';
import '../../Constants/custom_shapes.dart';
import 'ForgotPasswordDialog/forgot_password_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final MaskTextInputFormatter _formatter = MaskTextInputFormatter(
    mask: '+1 ###-###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );
  bool isVisible = false;
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isMobile = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        // padding: EdgeInsets.symmetric(
        //   horizontal: 4.w,
        //   vertical: 1.h,
        // ),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CustomPaint(
            //   painter: ShapesPainter(),
            //   child: Container(height: 55.h),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                // height: 40.h,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: Image.asset(Assets.logo),
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
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: double.infinity,
                            // height: 40.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 60.w,
                                  child: AutoSizeText.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Welcome Back",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Constants.fourthColor,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                // Card(
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(10),
                                //   ),
                                //   color: Constants.fourthColor,
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     width: double.infinity,
                                //     height: 5.h,
                                //     padding: EdgeInsets.symmetric(
                                //       horizontal: 4.w,
                                //     ),
                                //     child: Row(
                                //       children: [
                                //         Text(
                                //           "Working For Homeplate",
                                //           style: Theme.of(context)
                                //               .textTheme
                                //               .bodySmall
                                //               ?.copyWith(
                                //                 fontSize: 15.sp,
                                //                 color: Constants.primaryColor,
                                //               ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 1.5.h,
                                // ),
                                isMobile
                                    ? Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 1.w,
                                        ),
                                        height: 5.5.h,
                                        child: TextField(
                                          maxLength: 15,
                                          keyboardType: TextInputType.number,
                                          controller: mobile,
                                          inputFormatters: [_formatter],
                                          decoration: InputDecoration(
                                            counterStyle: const TextStyle(
                                              height: double.minPositive,
                                            ),
                                            counterText: "",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                color: Constants.fourthColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                color: Constants.fourthColor,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                color: Constants.fourthColor,
                                              ),
                                            ),
                                            filled: true,
                                            hintStyle: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 15.sp,
                                            ),
                                            hintText: "Mobile Number",
                                            fillColor: Colors.white70,
                                            prefixIcon: const Icon(
                                              Icons.phone,
                                              color: Constants.fourthColor,
                                            ),
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Constants.fourthColor,
                                                fontSize: 15.sp,
                                              ),
                                          textAlign: TextAlign.start,
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 1.w,
                                        ),
                                        height: 5.5.h,
                                        child: Center(
                                          child: TextField(
                                            controller: email,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              // contentPadding:EdgeInsets.symmetric(
                                              //   horizontal: 2.w,
                                              //
                                              // ),
                                              prefixIcon: const Icon(
                                                Icons.email,
                                                color: Constants.fourthColor,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  color: Constants.fourthColor,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  color: Constants.fourthColor,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  color: Constants.fourthColor,
                                                ),
                                              ),
                                              filled: true,
                                              hintStyle: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 15.sp,
                                              ),
                                              hintText: "Email Id",
                                              fillColor: Colors.white70,
                                            ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: Constants.fourthColor,
                                                  fontSize: 15.sp,
                                                ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 1.w,
                                  ),
                                  height: 5.5.h,
                                  child: TextField(
                                    controller: password,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: !isVisible,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Constants.fourthColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Constants.fourthColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Constants.fourthColor,
                                        ),
                                      ),
                                      filled: true,
                                      hintStyle: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 15.sp,
                                      ),
                                      hintText: "Password",
                                      fillColor: Colors.white70,
                                      prefixIcon: const Icon(
                                        Icons.password,
                                        color: Constants.fourthColor,
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isVisible = !isVisible;
                                          });
                                        },
                                        child: Icon(
                                          !isVisible
                                              ? Icons.remove_red_eye_outlined
                                              : Icons.remove_red_eye_sharp,
                                          color: Constants.fourthColor,
                                        ),
                                      ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Constants.fourthColor,
                                          fontSize: 15.sp,
                                        ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                SizedBox(
                                  width: 80.w,
                                  child: AutoSizeText.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return ForgotPasswordDialog();
                                                },
                                              );
                                            },
                                          text: "Forgot Password",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Constants.sixthColor,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 1.w,
                                  ),
                                  height: 5.5.h,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Constants.secondaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                    ),
                                    onPressed: () {
                                      if (isMobile) {
                                        if (validateMobile(mobile.text)) {
                                          if (password.text.isNotEmpty) {
                                            login();
                                          } else {
                                            var snackBar = SnackBar(
                                              backgroundColor:
                                                  Constants.secondaryColor,
                                              content: Text(
                                                'Enter a valid password',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      fontSize: 17.sp,
                                                      color: Constants
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        } else {
                                          var snackBar = SnackBar(
                                              backgroundColor:
                                                  Constants.secondaryColor,
                                              content: Text(
                                                'Enter a valid mobile number',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      fontSize: 17.sp,
                                                      color: Constants
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      } else {
                                        if (validateEmail(email.text)) {
                                          if (password.text.isNotEmpty) {
                                            login();

                                          } else {
                                            var snackBar = SnackBar(
                                              backgroundColor:
                                                  Constants.secondaryColor,
                                              content: Text(
                                                'Enter a valid password',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      fontSize: 17.sp,
                                                      color: Constants
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        } else {
                                          var snackBar = SnackBar(
                                              backgroundColor:
                                                  Constants.secondaryColor,
                                              content: Text(
                                                'Enter a valid email address',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      fontSize: 17.sp,
                                                      color: Constants
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      }
                                    },
                                    child: Text(
                                      "Login",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 19.sp,
                                            color: Constants.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: 0.1.h,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                      child: AutoSizeText.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "OR",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        Constants.fourthColor,
                                                    fontSize: 19.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: 0.1.h,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 1.w,
                                  ),
                                  height: 5.5.h,
                                  // width: 40.w,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Constants.secondaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isMobile = !isMobile;
                                      });
                                    },
                                    child: Text(
                                      isMobile
                                          ? "Login with Email"
                                          : "Login with Mobile",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 14.5.sp,
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
                                  width: 80.w,
                                  child: AutoSizeText.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Don't have an account? ",
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
                                              Navigation.instance.navigate(
                                                Routes.signUpScreen,
                                                args: "Working with Homeplate",
                                              );
                                            },
                                          text: "Sign Up",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Constants.sixthColor,
                                                fontSize: 15.sp,
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
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateMobile(String value) {
    String pattern =
        r'^(?:\+?\d{1,3})?[- ]?\(?(?:\d{3})\)?[- ]?\d{3}[- ]?\d{4}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value.replaceAll('-', ''))) {
      return false;
    }
    return true;
  }

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  void login() async {
    final response = await ApiProvider.instance
        .login(email.text, convertPhoneNumber(mobile.text), password.text);
    if (response.success) {
      Storage.instance.setUser("${response.data?.id}");
      Navigation.instance.navigateAndRemoveUntil(Routes.getOrderScreen);
    } else {
      var snackBar = SnackBar(
          backgroundColor: Constants.secondaryColor,
          content: Text(
            response.message ?? 'Enter valid details',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 17.sp,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  String convertPhoneNumber(String phoneNumber) {
    return phoneNumber.replaceFirst(RegExp(r'^\+1\s*'), '');
  }
}

