import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/common_function.dart';
import '../../Constants/constants.dart';
import '../../Repository/repository.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Repository>(context, listen: false).profile;
    final int status = data?.status ?? 0;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          title: AutoSizeText(
            "Verify Email",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.secondaryColor,
                  fontSize: 18.sp,
                ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 2.h,
          ),
          color: Constants.bgColor,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Email Address",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black87,
                              fontSize: 16.sp,
// fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 1.w,
                  ),
                  height: 5.5.h,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: emailController,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(
                        height: double.minPositive,
                      ),
                      counterText: "",
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
                      hintText: "Please enter your email",
                      fillColor: Constants.primaryColor,
                    ),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Constants.fourthColor,
                          fontSize: 15.sp,
                        ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
               status==2?Container(): Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 1.w,
                  ),
                  height: 7.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      if (emailController.text.isNotEmpty &&
                          validateEmail(emailController.text)) {
                        updateEmail();
                      } else {
                        var snackBar = SnackBar(
                            backgroundColor: Constants.secondaryColor,
                            content: Text(
                              'Enter all the details',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 17.sp,
                                    color: Constants.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // Navigation.instance.goBack();
                      }
                    },
                    child: Text(
                      "Update and verify Email",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
              ],
            ),
          ),
        ));
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

  void updateEmail() async{
    await CommonFunction().showLoadingDialog(context);
    final response = await ApiProvider.instance.driverUpdateEmail(emailController.text);
    if(response.success??false){
      verifyEmail();
    }else{
      CommonFunction().hideLoadingDialog(context);
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

  void verifyEmail() async{
    final response = await ApiProvider.instance.VerifyDriverEmail();
    if(response.success??false){
      var snackBar = SnackBar(
        backgroundColor: Constants.seventhColor,
        content: Text(
          response.message ?? 'Email Verified Successfully',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 17.sp,
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigation.instance.goBack();
    }else{
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
