import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/assets.dart';
import '../../Constants/constants.dart';
import '../../Model/pass_arguments.dart';
import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';
import '../../main.dart';

class OTPVerificationPage extends StatefulWidget {
  // const OTPVerificationPage({super.key, required this.mobile});

  final ScreenArguments info;

  const OTPVerificationPage({super.key, required this.info});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  String? otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.h,
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 60.w,
                height: 14.h,
                child: Image.asset(
                  Assets.logo,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Card(
                color: Constants.bgColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.5.h,
                  ),
                  child: Container(
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 4.w,
                    // ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: double.infinity,
                    height: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Enter OTP to verify\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Constants.fourthColor,
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text:
                                      "A 4 digit OTP has been sent to your phone number \n+1 XXX-XXX-${widget.info.mobile.substring(6)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Constants.fourthColor,
                                        fontSize: 15.sp,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedBox(
                          width: 90.w,
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Enter the OTP",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Constants.fourthColor,
                                        fontSize: 15.sp,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        SizedBox(
                          width: 95.w,
                          child: OtpTextField(
                            numberOfFields: 4,
                            borderColor: Constants.fourthColor,
                            focusedBorderColor: Constants.fourthColor,
                            filled: true,

                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String code) {
                              setState(() {
                                otp = code;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 4.w,
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
                              // verifyOTP();
                              Navigation.instance.navigateAndRemoveUntil(
                                Routes.profileCreateScreen,
                                args: widget.info,
                              );
                            },
                            child: Text(
                              "Verify OTP",
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
                                  text: "Didn't receive the OTP?\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Constants.fourthColor,
                                        fontSize: 16.sp,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      resendOTP();
                                    },
                                  text: "Resent",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: Constants.fourthColor,
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
            ],
          ),
        ),
      ),
    );
  }

  void verifyOTP() async {
    final response =
        await ApiProvider.instance.driverVerifyOtp(widget.info.mobile, otp);
    if (response.success ?? false) {
      Navigation.instance.navigateAndRemoveUntil(
        Routes.profileCreateScreen,
        args: widget.info,
      );
    } else {
      var snackBar = SnackBar(
          backgroundColor: Constants.secondaryColor,
          content: Text(
            'Enter a valid OTP',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 17.sp,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void resendOTP() async {
    final response = await ApiProvider.instance
        .driverSendOtp(convertPhoneNumber(widget.info!.mobile));
    if (response.success ?? false) {
      var snackBar = SnackBar(
          backgroundColor: Constants.secondaryColor,
          content: Text(
            response.message ?? 'OTP resend successfully',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 17.sp,
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
