import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Model/pass_arguments.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:home_plate/main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/assets.dart';
import '../../Constants/constants.dart';
import '../../Constants/custom_shapes.dart';
import '../../Navigation/Navigate.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.are_you_a});

  final String are_you_a;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController mobile = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();

  final MaskTextInputFormatter _formatter = MaskTextInputFormatter(
    mask: '+1 ###-###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 1.w,
          vertical: 2.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Constants.bgColor,
        ),
        width: double.infinity,
        // height: 40.h,
        child: Container(
          height: 100.h,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60.w,
                  child: Image.asset(
                    Assets.logo,
                  ),
                ),
                Card(
                  color: Constants.bgColor,
                  child: Container(
                    width: double.infinity,
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
                                // TextSpan(
                                //   text: "Register\n",
                                //   style: Theme.of(context)
                                //       .textTheme
                                //       .bodySmall
                                //       ?.copyWith(
                                //     color: Constants.secondaryColor,
                                //     fontSize: 24.sp,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                TextSpan(
                                  text: "Create Account",
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
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 1.w,
                          ),
                          height: 5.5.h,
                          child: Center(
                            child: TextField(
                              controller: fname,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                // contentPadding:EdgeInsets.symmetric(
                                //   horizontal: 2.w,
                                //
                                // ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Constants.fourthColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 15.sp,
                                ),
                                hintText: "First Name",
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
                          child: Center(
                            child: TextField(
                              controller: lname,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                // contentPadding:EdgeInsets.symmetric(
                                //   horizontal: 2.w,
                                //
                                // ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Constants.fourthColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 15.sp,
                                ),
                                hintText: "Last Name",
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
                          child: Center(
                            child: TextField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
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
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
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
                          child: Center(
                            child: TextField(
                              maxLength: 15,
                              controller: mobile,
                              keyboardType: TextInputType.number,
                              inputFormatters: [_formatter],
                              decoration: InputDecoration(
                                // contentPadding:EdgeInsets.symmetric(
                                //   horizontal: 2.w,
                                //
                                // ),
                                counterStyle: TextStyle(
                                  height: double.minPositive,
                                ),
                                counterText: "",
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Constants.fourthColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
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
                          height: 2.h,
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
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                            onPressed: () {
                              print(mobile.text);
                              // Navigation.instance.navigate(
                              //   Routes.otpScreen,
                              //   args: ScreenArguments(
                              //     email.text,
                              //     mobile.text,
                              //     widget.are_you_a,
                              //     fname.text,
                              //     lname.text,
                              //   ),
                              // );
                              if (validateMobile(mobile.text)) {
                                if (fname.text.isNotEmpty) {
                                  if (lname.text.isNotEmpty) {
                                    if (validateEmail(email.text)) {
                                      sendOTP();
                                    } else {
                                      var snackBar = SnackBar(
                                        backgroundColor:
                                            Constants.secondaryColor,
                                        content: Text(
                                          'Enter a valid Email',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontSize: 17.sp,
                                                color: Constants.primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  } else {
                                    var snackBar = SnackBar(
                                      backgroundColor: Constants.secondaryColor,
                                      content: Text(
                                        'Enter a valid Last Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontSize: 17.sp,
                                              color: Constants.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                } else {
                                  var snackBar = SnackBar(
                                    backgroundColor: Constants.secondaryColor,
                                    content: Text(
                                      'Enter a valid First Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 17.sp,
                                            color: Constants.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              } else {
                                var snackBar = SnackBar(
                                    backgroundColor: Constants.secondaryColor,
                                    content: Text(
                                      'Enter a valid mobile number',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 17.sp,
                                            color: Constants.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Text(
                              "Send OTP",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
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
                          width: 80.w,
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
                  height: 5.h,
                ),
              ],
            ),
          ),
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

  void sendOTP() async{
    final response = await ApiProvider.instance.driverSendOtp(convertPhoneNumber(mobile.text));
    if(response.success??false){
      Navigation.instance.navigate(
        Routes.otpScreen,
        args: ScreenArguments(
          email.text,
          mobile.text,
          widget.are_you_a,
          fname.text,
          lname.text,
        ),
      );
    }else{
      var snackBar = SnackBar(
          backgroundColor: Constants.secondaryColor,
          content: Text(
            response.message??'Something went wrong',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(
              fontSize: 17.sp,
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ));
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBar);
    }
  }
}
