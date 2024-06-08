import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Storage/CustomStorage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/common_function.dart';
import '../../Constants/constants.dart';
import '../../Navigation/Navigate.dart';
import '../../Repository/repository.dart';

class UpdateBankDetails extends StatefulWidget {
  const UpdateBankDetails({super.key});

  @override
  State<UpdateBankDetails> createState() => _UpdateBankDetailsState();
}

class _UpdateBankDetailsState extends State<UpdateBankDetails> {
  String bank_name = "Royal Bank of Canada";
  final bank = TextEditingController();
  final transit = TextEditingController();
  final institution = TextEditingController();
  List<String> bank_names = [
    "Royal Bank of Canada",
    "Toronto-Dominion Bank",
    "Bank of Nova Scotia",
    "Bank of Montreal",
    "Canadian Imperial Bank of Canada",
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      loadBankDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Repository>(context, listen: false).profile;
    final int status = data?.status ?? 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: AutoSizeText(
          "Update Bank Details",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.secondaryColor,
                fontSize: 18.sp,
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 1.h,
        ),
        color: Constants.bgColor,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 1.h,
            ),
            AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Bank Name",
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
                color: Constants.primaryColor,
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
                      bank_name = _!;
                    });
                  },
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                  fillColor: Constants.primaryColor,
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
                  fillColor: Constants.primaryColor,
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
                  fillColor: Constants.primaryColor,
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
            const Spacer(),
            status == 2
                ? Container()
                : Container(
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
                        if (bank.text.isNotEmpty &&
                            transit.text.isNotEmpty &&
                            institution.text.isNotEmpty) {
                          updateBankDetails();
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
                        "Update Bank Details",
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
    );
  }

  void updateBankDetails() async {
    await CommonFunction().showLoadingDialog(context);
    final response = await ApiProvider.instance.updateDriverBankDetails(
        bank_name, transit.text, bank.text, institution.text);
    if (response.success ?? false) {
      CommonFunction().hideLoadingDialog(context);
      var snackBar = SnackBar(
          backgroundColor: Constants.seventhColor,
          content: Text(
            response.message ?? 'Document Updated Successfully',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 17.sp,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigation.instance.goBack();
    } else {
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
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigation.instance.goBack();
    }
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
