import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:home_plate/Functions/EditProfile/Widgets/driving_license_card.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Repository/repository.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Widgets/bank_details_card.dart';
import 'Widgets/gst_details_card.dart';
import 'Widgets/personal_details_card.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final dlNumber = TextEditingController();
  final gst = TextEditingController();
  final qst = TextEditingController();
  final bank = TextEditingController();
  final transit = TextEditingController();
  final institution = TextEditingController();
  final province = TextEditingController();
  final postalcode = TextEditingController();
  final address = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isPasswordVisible = false, isConfirmPasswordVisible = false;
  String? bank_name = "Royal Bank of Canada",
      doc_pic,
      profile_pic,
      city,
      dl_url,
      gst_pic,
      qst_pic;
  File? dl_photo, gst_doc, qst_doc;
  List<String> bank_names = [
    "Royal Bank of Canada",
    "Toronto-Dominion Bank",
    "Bank of Nova Scotia",
    "Bank of Montreal",
    "Canadian Imperial Bank of Canada",
  ];
  String dob = "Please select your date of birth";

// final email = TextEditingController();
// String? address;
  @override
  void initState() {
    super.initState();
// address.addListener(_onSearchChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadPersonalDetails();
      loadDrivingDetails();
      loadGSTDetails();
      loadBankDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: AutoSizeText(
          "Profile Update",
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
              PersonalDetailsCard(
                province: province,
                postalcode: postalcode,
                address: address,
                password: password,
                confirmPassword: confirmPassword,
                firstname: firstname,
                lastname: lastname,
                dob: dob,
                updateDOB: (String val) {
                  setState(() {
                    dob = val;
                  });
                },
                document: doc_pic ?? "",
                profile_pic: profile_pic ?? "",
                loadProfile: () {
                  fetchPersonalDetails();
                },
                city: city ?? "",
              ),
              // const Divider(),
              SizedBox(
                height: 2.h,
              ),
              DrivingLicenseCard(
                dlNumber: dlNumber,
                onTap: (File val) {
                  setState(() {
                    dl_photo = val;
                  });
                },
                dl_url: dl_url ?? "",
                fetchDetails: () {
                  fetchPersonalDetails();
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              GstDetailsCard(
                gst: gst,
                qst: qst,
                gst_url: gst_pic ?? "",
                qst_url: qst_pic ?? "",
                gst_doc: gst_doc,
                qst_doc: qst_doc,
                onGST: (File val) {
                  setState(() {
                    gst_doc = val;
                  });
                },
                onQST: (File val) {
                  setState(() {
                    qst_doc = val;
                  });
                },
                fetchDetails: () {
                  fetchPersonalDetails();
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              BankDetailsCard(
                bank: bank,
                transit: transit,
                institution: institution,
                bank_names: bank_names,
                updateBankName: (String val) {
                  setState(() {
                    bank_name = val;
                  });
                },
                loadProfile: () {
                  fetchPersonalDetails();
                },
              ),
              SizedBox(
                height: 3.h,
              ),

              // Container(
              //   margin: EdgeInsets.symmetric(
              //     horizontal: 1.w,
              //   ),
              //   height: 5.5.h,
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Constants.secondaryColor,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12), // <-- Radius
              //       ),
              //     ),
              //     onPressed: () {
              //       if (firstname.text.isNotEmpty &&
              //           lastname.text.isNotEmpty &&
              //           dob != null &&
              //           address.text.isNotEmpty &&
              //           province.text.isNotEmpty &&
              //           postalcode.text.isNotEmpty &&
              //           password.text.isNotEmpty &&
              //           confirmPassword.text.isNotEmpty) {
              //         if (validatePassword(password.text)) {
              //           if (password.text == confirmPassword.text) {
              //             var snackBar = SnackBar(
              //               backgroundColor: Constants.seventhColor,
              //               content: Text(
              //                 'Profile Updated Successfully',
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodySmall
              //                     ?.copyWith(
              //                       fontSize: 17.sp,
              //                       color: Constants.primaryColor,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //               ),
              //             );
              //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //             Navigation.instance
              //                 .navigate(Routes.profileVerificationScreen);
              //           } else {
              //             var snackBar = SnackBar(
              //               backgroundColor: Constants.secondaryColor,
              //               content: Text(
              //                 'Please ensure both passwords match',
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodySmall
              //                     ?.copyWith(
              //                       fontSize: 17.sp,
              //                       color: Constants.primaryColor,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //               ),
              //             );
              //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //           }
              //         } else {
              //           var snackBar = SnackBar(
              //             backgroundColor: Constants.secondaryColor,
              //             content: Text(
              //               'Please ensure to enter a valid password',
              //               style:
              //                   Theme.of(context).textTheme.bodySmall?.copyWith(
              //                         fontSize: 17.sp,
              //                         color: Constants.primaryColor,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //             ),
              //           );
              //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //         }
              //       } else {
              //         var snackBar = SnackBar(
              //           backgroundColor: Constants.secondaryColor,
              //           content: Text(
              //             'Please enter all the information',
              //             style:
              //                 Theme.of(context).textTheme.bodySmall?.copyWith(
              //                       fontSize: 17.sp,
              //                       color: Constants.primaryColor,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //           ),
              //         );
              //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //       }
              //     },
              //     child: Text(
              //       "Update Profile",
              //       style: Theme.of(context).textTheme.bodySmall?.copyWith(
              //             fontSize: 17.sp,
              //             color: Constants.primaryColor,
              //             fontWeight: FontWeight.bold,
              //           ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
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

  void loadPersonalDetails() {
    final data = Provider.of<Repository>(context, listen: false).profile;
    firstname.text = data?.firstName ?? "";
    lastname.text = data?.lastName ?? "";
    address.text = data?.full_address ?? "";
    province.text = data?.province ?? "";
    postalcode.text = data?.postal_code ?? "";
    doc_pic = data?.address_proof ?? "";
    profile_pic = data?.profile_pic ?? "";
    city = data?.city ?? "";
    debugPrint(
        "data?.address_proof ${data?.address_proof}\n${data?.profile_pic}");
    setState(() {});
  }

  Future<void> fetchPersonalDetails() async {
    final response = await ApiProvider.instance.getMyDetails();
    if (response.success ?? false) {
      Provider.of<Repository>(context, listen: false)
          .setProfileModel(response.data!);
      loadPersonalDetails();
      loadDrivingDetails();
      loadGSTDetails();
      loadBankDetails();
      Navigation.instance.goBack();
    }
  }

  void loadDrivingDetails() {
    final data = Provider.of<Repository>(context, listen: false).profile;
    dlNumber.text = data?.driving_licence_no ?? "";
    dl_url = data?.driving_licence_proof ?? "";
    debugPrint("db ${data?.driving_licence_proof ?? ""}");
    setState(() {});
  }

  void loadGSTDetails() {
    final data = Provider.of<Repository>(context, listen: false).profile;
    gst.text = data?.gst_no ?? "";
    qst.text = data?.qst_no ?? "";
    gst_pic = data?.gst_image ?? "";
    qst_pic = data?.qst_image ?? "";
    setState(() {});
  }

  void loadBankDetails() {
    final data = Provider.of<Repository>(context, listen: false).profile;
    bank.text = data?.account_number ?? "";
    transit.text = data?.transit_number ?? "";
    institution.text = data?.institution_number ?? "";
    bank_name = data?.bank_name ?? "";
    setState(() {});
  }
}
