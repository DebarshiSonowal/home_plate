import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Api/api_provider.dart';
import '../../../Constants/constants.dart';

class ForgotPasswordDialog extends StatefulWidget {
  @override
  _ForgotPasswordDialogState createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isVisible = false, isVisible2 = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constants.bgColor,
      title: SizedBox(
        width: 20.w,
        height: 4.h,
        child: AutoSizeText(
          "Forgot Password",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.fourthColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
      ),
      content: Container(
        // color: Constants.bgColor,
        width: 90.w,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 90.w,
                child: TextFormField(
                  controller: _userNameController,
                  keyboardType: TextInputType.name,
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
                    hintText: "Username",
                    fillColor: Colors.white70,
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.fourthColor,
                        fontSize: 15.sp,
                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                width: 90.w,
                child: TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isVisible,
                  decoration: InputDecoration(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.fourthColor,
                        fontSize: 15.sp,
                      ),
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                width: 90.w,
                child: TextFormField(
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isVisible2,
                  decoration: InputDecoration(
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
                    hintText: "Confirm Password",
                    fillColor: Colors.white70,
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Constants.fourthColor,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible2 = !isVisible2;
                        });
                      },
                      child: Icon(
                        !isVisible2
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye_sharp,
                        color: Constants.fourthColor,
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.fourthColor,
                        fontSize: 15.sp,
                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        TextButton(
          child: Text(
            'Confirm',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.seventhColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
          ),
          onPressed: () {
            if (_userNameController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty &&
                _confirmPasswordController.text.isNotEmpty &&
                (_passwordController.text == _confirmPasswordController.text)) {
              if (validatePassword(_passwordController.text)) {
                if (validateMobile(_userNameController.text) ||
                    validateEmail(_userNameController.text)) {
                  forgotPassword();
                } else {
                  Fluttertoast.showToast(msg: "Please Enter a valid Email or Password");
                }
              } else {
                Fluttertoast.showToast(msg: "Please Enter a valid password");
              }
            } else {
              Fluttertoast.showToast(msg: "Please Enter all the information");
            }
          },
        ),
      ],
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

  bool validatePassword(String password) {
    // Regex pattern for password validation
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  void forgotPassword() async {
    final response = await ApiProvider.instance.driverForgetPassword(
        _userNameController.text,
        _confirmPasswordController.text,
        _confirmPasswordController.text);
    if (response.success ?? false) {
      Fluttertoast.showToast(
          msg: response.message ?? "Password Changed Successfully");
      Navigator.of(context).pop();
    } else {
      Fluttertoast.showToast(msg: response.message ?? "Something went wrong");
      Navigator.of(context).pop();
    }
  }
}
