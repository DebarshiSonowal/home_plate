import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Api/api_provider.dart';
import '../../../Constants/common_function.dart';
import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';

class BankDetailsCard extends StatefulWidget {
  const BankDetailsCard(
      {super.key,
      required this.bank,
      required this.transit,
      required this.institution,
      required this.bank_names,
      this.bank_name,
      required this.updateBankName,
      required this.loadProfile});

  final TextEditingController bank;
  final TextEditingController transit;
  final TextEditingController institution;
  final List<String> bank_names;
  final String? bank_name;
  final Function(String val) updateBankName;
  final Function loadProfile;

  @override
  State<BankDetailsCard> createState() => _BankDetailsCardState();
}

class _BankDetailsCardState extends State<BankDetailsCard> {
  String selectedBankName = 'Royal Bank of Canada';

  @override
  void initState() {
    super.initState();
    // selectedBankName = widget.bank_name??""; // Initialize with the initial value
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
              color: Constants.bgColor,
            ),
            height: 5.5.h,
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedBankName,
                items: widget.bank_names.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Constants.fourthColor,
                            fontSize: 15.sp,
                          ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedBankName =
                        newValue ?? ""; // Update the selected value
                    widget.updateBankName(
                        newValue ?? ""); // Update the parent widget
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
              controller: widget.bank,
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
              controller: widget.transit,
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
              controller: widget.institution,
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
                hintText: "Please enter your institution no",
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
                if (selectedBankName.isNotEmpty &&
                    (widget.transit.text.isNotEmpty) &&
                    widget.institution.text.isNotEmpty) {
                  updateBankDetails();
                } else {
                  var snackBar = SnackBar(
                    backgroundColor: Constants.secondaryColor,
                    content: Text(
                      'Please Enter all information',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
    );
  }

  void updateBankDetails() async {
    await CommonFunction().showLoadingDialog(context);
    final response = await ApiProvider.instance.updateDriverBankDetails(
        selectedBankName,
        widget.transit.text,
        widget.bank.text,
        widget.institution.text);
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
      widget.loadProfile();
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
      // Navigation.instance.goBack();
    }
  }
}
