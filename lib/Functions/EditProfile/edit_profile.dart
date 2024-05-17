import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final dlNumber = TextEditingController();
  final gst = TextEditingController();
  final qst = TextEditingController();
  final bank = TextEditingController();
  final transit = TextEditingController();
  final institution = TextEditingController();
  final province = TextEditingController();
  final postalcode = TextEditingController();
  final address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isPasswordVisible = false,
      isConfirmPasswordVisible = false,
      _isValidPassword = true,
      _isValidConfirmPassword = true;
  String? dob = "Please select your date of birth",
      bank_name = "Royal Bank of Canada";
  File? dl_photo, gst_doc, qst_doc;
  List<Placemark> _suggestions = [];
  List<String> bank_names = [
    "Royal Bank of Canada",
    "Toronto-Dominion Bank",
    "Bank of Nova Scotia",
    "Bank of Montreal",
    "Canadian Imperial Bank of Canada",
  ];

// final email = TextEditingController();
// String? address;
  @override
  void initState() {
    super.initState();
// address.addListener(_onSearchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: AutoSizeText(
          "Profile Create",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.secondaryColor,
                fontSize: 18.sp,
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.5.h,
        ),
        height: double.infinity,
        width: double.infinity,
        color: Constants.bgColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
//               AutoSizeText.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "Modify the information below and update when done",
//                       style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             color: Colors.black87,
//                             fontSize: 18.sp,
// // fontWeight: FontWeight.bold,
//                           ),
//                     ),
// // TextSpan(
// //   text:
// //   "#1109",
// //   style:
// //   Theme.of(context).textTheme.bodySmall?.copyWith(
// //     color: Colors.black54,
// //     fontSize: 14.sp,
// //     fontWeight: FontWeight.bold,
// //   ),
// // ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                child: ExpansionTile(
                  backgroundColor: Constants.primaryColor,
                  collapsedBackgroundColor: Constants.primaryColor,
                  title: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Personal Info",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black87,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.h,
                  ),
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "First Name",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
// maxLength: 10,
                        keyboardType: TextInputType.text,
                        controller: firstname,
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
                          hintText: "Please enter your firstname",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Last Name",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
// maxLength: 10,
                        keyboardType: TextInputType.text,
                        controller: lastname,
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
                          hintText: "Please enter your lastname",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Date of Birth",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        BottomPicker.date(
                          pickerTitle: Text(
                            'Set your Birthday',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Constants.secondaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          dateOrder: DatePickerDateOrder.dmy,
                          initialDateTime: DateTime(1996, 10, 22),
                          maxDateTime: DateTime(1998),
                          minDateTime: DateTime(1980),
                          pickerTextStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Constants.fourthColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                          buttonSingleColor: Constants.seventhColor,
                          onChange: (index) {
                            print(index);
                          },
                          onSubmit: (index) {
                            setState(() {
                              dob = DateFormat("dd-MMM-yyyy").format(
                                  DateFormat("yyyy-MM-dd").parse(
                                      DateTime.parse(index.toString())
                                          .toString()));
                            });
                          },
                          bottomPickerTheme: BottomPickerTheme.plumPlate,
                        ).show(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Constants.bgColor,
                          border: Border.all(
                            color: Constants.fourthColor,

// borderSide: const BorderSide(
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 1.w,
                        ),
                        height: 5.5.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 1.2.h,
                        ),
                        child: Text(
                          dob ?? "Please select your date of birth",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black87,
                                    fontSize: 15.sp,
// fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Address",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      // color: Constants.bgColor,
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
// maxLength: 10,
                        keyboardType: TextInputType.text,
                        controller: address,
                        onChanged: (val) {
                          _onSearchChanged();
                        },
                        onSubmitted: (val) {},
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
                          hintText: "Please enter your address",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Card(
                      elevation: 4,
                      child: Container(
                        color: Constants.primaryColor,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: _suggestions.length,
                          itemBuilder: (context, index) {
                            final suggestion = _suggestions[index];
                            return ListTile(
                              title: Text(suggestion.name ?? ''),
                              subtitle: Text(suggestion.locality ?? ''),
                              onTap: () {
// Handle location selection
                                address.text = suggestion.name!;
                                province.text = suggestion.administrativeArea!;
                                postalcode.text = suggestion.postalCode!;
                                _suggestions = [];
                                setState(() {}); // Clear suggestions
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Province",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
// maxLength: 10,
                        keyboardType: TextInputType.text,
                        controller: province,
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
                          hintText: "Please enter your province",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Postal Code",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black87,
                                      fontSize: 16.sp,
                                    ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
// maxLength: 10,
                        keyboardType: TextInputType.text,
                        controller: postalcode,
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
                          hintText: "Please enter your postal code",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Password",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: _isValidPassword ? 5.5.h : 9.h,
                      child: TextField(
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !isPasswordVisible,
                        onChanged: (value) {
// Validate password on every change
                          setState(() {
                            _isValidPassword = validationPassword(value);
                          });
                        },
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
                          hintText: "Please enter your password",
                          fillColor: Constants.bgColor,
                          errorText: _isValidPassword
                              ? null
                              : 'Password does not meet requirements',
// prefixIcon: const Icon(
//   Icons.password,
//   color: Constants.fourthColor,
// ),

                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Icon(
                              !isPasswordVisible
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
                        textAlign: TextAlign.start,
                      ),
                    ),
                    validationPassword(password.text)
                        ? Container()
                        : SizedBox(
                            height: 1.h,
                          ),
                    validationPassword(password.text)
                        ? Container()
                        : Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.5.w,
                              vertical: 1.h,
                            ),
                            decoration: BoxDecoration(
                                color: Constants.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                )),
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Password should meet the following requirements",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Colors.black87,
                                              fontSize: 15.sp,
// fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      hasUppercase(password.text)
                                          ? Icons.check
                                          : Icons.cancel,
                                      color: hasUppercase(password.text)
                                          ? Constants.seventhColor
                                          : Constants.secondaryColor,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    AutoSizeText.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "Atleast one uppercase letter",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: hasUppercase(
                                                          password.text)
                                                      ? Constants.seventhColor
                                                      : Constants
                                                          .secondaryColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      hasLowercase(password.text)
                                          ? Icons.check
                                          : Icons.cancel,
                                      color: hasLowercase(password.text)
                                          ? Constants.seventhColor
                                          : Constants.secondaryColor,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    AutoSizeText.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "Atleast one lowercase letter",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: hasLowercase(
                                                          password.text)
                                                      ? Constants.seventhColor
                                                      : Constants
                                                          .secondaryColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      hasNumber(password.text)
                                          ? Icons.check
                                          : Icons.cancel,
                                      color: hasNumber(password.text)
                                          ? Constants.seventhColor
                                          : Constants.secondaryColor,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    AutoSizeText.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Atleast one number",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      hasNumber(password.text)
                                                          ? Constants
                                                              .seventhColor
                                                          : Constants
                                                              .secondaryColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      hasSpecialCharacter(password.text)
                                          ? Icons.check
                                          : Icons.cancel,
                                      color: hasSpecialCharacter(password.text)
                                          ? Constants.seventhColor
                                          : Constants.secondaryColor,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    AutoSizeText.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "Atleast one special character",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: hasSpecialCharacter(
                                                          password.text)
                                                      ? Constants.seventhColor
                                                      : Constants
                                                          .secondaryColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      hasMinLength(password.text)
                                          ? Icons.check
                                          : Icons.cancel,
                                      color: hasMinLength(password.text)
                                          ? Constants.seventhColor
                                          : Constants.secondaryColor,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    AutoSizeText.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Be atleast 8 characters",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: hasMinLength(
                                                          password.text)
                                                      ? Constants.seventhColor
                                                      : Constants
                                                          .secondaryColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Confirm Password",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: _isValidConfirmPassword ? 5.5.h : 9.h,
                      child: TextField(
                        controller: confirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !isConfirmPasswordVisible,
                        onChanged: (value) {
// Validate password on every change
                          setState(() {
                            _isValidConfirmPassword = validationPassword(value);
                          });
                        },
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
                          hintText: "Please enter your confirm password",
                          errorText: _isValidConfirmPassword
                              ? null
                              : 'Password does not meet requirements',
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.password,
//   color: Constants.fourthColor,
// ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isConfirmPasswordVisible =
                                    !isConfirmPasswordVisible;
                              });
                            },
                            child: Icon(
                              !isConfirmPasswordVisible
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
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              // const Divider(),
              SizedBox(
                height: 2.h,
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                child: ExpansionTile(
                  backgroundColor: Constants.primaryColor,
                  collapsedBackgroundColor: Constants.primaryColor,
                  title: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Driving License",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black87,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.h,
                  ),
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "DL Number",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
// maxLength: 10,
                        keyboardType: TextInputType.text,
                        controller: dlNumber,
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
                          hintText: "Please enter your DL number",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Document",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          pickImage((path) {
                            setState(() {
                              dl_photo = File(path);
                            });
                          });
                        },
                        child: DottedBorder(
                          color: Colors.black,
                          strokeWidth: 1,
                          child: Container(
                            color: Constants.bgColor,
                            height: 20.h,
                            width: double.infinity,
                            child: Center(
                              child: dl_photo == null
                                  ? Icon(
                                      Icons.folder,
                                      size: 35.sp,
                                    )
                                  : Image.file(File(dl_photo!.path)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                child: ExpansionTile(
                  backgroundColor: Constants.primaryColor,
                  collapsedBackgroundColor: Constants.primaryColor,
                  title: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "GST and QST Details",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black87,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.h,
                  ),
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "GST Number",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
// maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: gst,
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
                          hintText: "Please enter your gst",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "QST Number",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
// maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: qst,
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
                          hintText: "Please enter your qst",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "GST Document",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          pickImage((path) {
                            setState(() {
                              gst_doc = File(path);
                            });
                          });
                        },
                        child: DottedBorder(
                          color: Colors.black,
                          strokeWidth: 1,
                          child: Container(
                            color: Constants.bgColor,
                            height: 20.h,
                            width: double.infinity,
                            child: Center(
                              child: gst_doc == null
                                  ? Icon(
                                      Icons.folder,
                                      size: 35.sp,
                                    )
                                  : Image.file(File(gst_doc!.path)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "QST Document",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          pickImage((path) {
                            setState(() {
                              qst_doc = File(path);
                            });
                          });
                        },
                        child: DottedBorder(
                          color: Colors.black,
                          strokeWidth: 1,
                          child: Container(
                            color: Constants.bgColor,
                            height: 20.h,
                            width: double.infinity,
                            child: Center(
                              child: qst_doc == null
                                  ? Icon(
                                      Icons.folder,
                                      size: 35.sp,
                                    )
                                  : Image.file(File(qst_doc!.path)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                child: ExpansionTile(
                  backgroundColor: Constants.primaryColor,
                  collapsedBackgroundColor: Constants.primaryColor,
                  title: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Bank Details",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black87,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.h,
                  ),
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Bank Name",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Constants.fourthColor,
// borderSide: const BorderSide(
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Constants.bgColor,
                      ),
                      height: 5.5.h,
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: bank_name,
                          items: bank_names.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {
                            setState(() {
                              bank_name = _;
                            });
                          },
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Constants.fourthColor,
                                    fontSize: 15.sp,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Bank Number",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
// maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: bank,
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
                          hintText: "Please enter your account no",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Transit Number",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: transit,
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
                          hintText: "Please enter your transit no",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Institution Number",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 1.w,
                      ),
                      height: 5.5.h,
                      child: TextField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: institution,
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
                          hintText: "Please enter your transit no",
                          fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              SizedBox(
                height: 3.h,
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
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    if (firstname.text.isNotEmpty &&
                        lastname.text.isNotEmpty &&
                        dob != null &&
                        address.text.isNotEmpty &&
                        province.text.isNotEmpty &&
                        postalcode.text.isNotEmpty &&
                        password.text.isNotEmpty &&
                        confirmPassword.text.isNotEmpty) {
                      if (validatePassword(password.text)) {
                        if (password.text == confirmPassword.text) {
                          var snackBar = SnackBar(
                            backgroundColor: Constants.seventhColor,
                            content: Text(
                              'Profile Updated Successfully',
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
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigation.instance
                              .navigate(Routes.profileVerificationScreen);
                        } else {
                          var snackBar = SnackBar(
                            backgroundColor: Constants.secondaryColor,
                            content: Text(
                              'Please ensure both passwords match',
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
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        var snackBar = SnackBar(
                          backgroundColor: Constants.secondaryColor,
                          content: Text(
                            'Please ensure to enter a valid password',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 17.sp,
                                      color: Constants.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } else {
                      var snackBar = SnackBar(
                        backgroundColor: Constants.secondaryColor,
                        content: Text(
                          'Please enter all the information',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 17.sp,
                                    color: Constants.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    "Update Profile",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 17.sp,
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage(Function(String path) onTap) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    onTap(image!.path);
  }

  Future<void> _onSearchChanged() async {
    print("Searching... ${address.text}");
    if (address.text.isEmpty) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    try {
// List<Location> locations = await locationFromAddress(address.text);
      List<Location> locations = await locationFromAddress(address.text);
      print(
          "Searching... Locations ${locations[0].latitude} ${locations[0].longitude}");
      List<Placemark> placemarks = await placemarkFromCoordinates(
          locations[0].latitude, locations[0].longitude);
      setState(() {
        _suggestions = placemarks;
      });
    } catch (e) {
      print(e);
      setState(() {
        _suggestions = [];
      });
// Handle error (e.g., show a snackbar)
    }
  }

  bool validatePassword(String password) {
// Regex pattern for password validation
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  bool validationPassword(String password) {
// Regex pattern for password validation
    if (password.isEmpty) {
      return true;
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  bool hasUppercase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  bool hasLowercase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  bool hasNumber(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  bool hasSpecialCharacter(String password) {
    return password.contains(RegExp(r'[!@#\$&*~]'));
  }

  bool hasMinLength(String password) {
    return password.length >= 8;
  }
}
