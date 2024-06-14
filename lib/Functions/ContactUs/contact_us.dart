import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/constants.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final types = ["Order", "Payment", "Delivery", "Working on"];
  String? selectedType;
  final description = TextEditingController();


  @override
  void dispose() {
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.fourthColor,
                // fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 1.h,
        ),
        width: double.infinity,
        height: double.infinity,
        color: Constants.bgColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              AutoSizeText(
                "I need help for?",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.fourthColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              AutoSizeText(
                "Select the category that best describes the issues you are facing.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.fourthColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 6.h,
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedType,
                    items: types.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Constants.fourthColor,
                                    fontSize: 15.sp,
                                  ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedType = newValue;
                      });
                    },
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Constants.fourthColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              AutoSizeText(
                "Problem Description",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.fourthColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              AutoSizeText(
                "Following issue you are facing give a short description on it",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.fourthColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              TextField(
                maxLines: 7,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Enter problem description"
                ),
                cursorColor: Constants.fourthColor,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.fourthColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
              // const Spacer(),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 6.h,
                width: 100.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if(selectedType!=""&&description.text.isNotEmpty){

                    }else{
                      var snackBar = SnackBar(
                        backgroundColor:
                        Constants.secondaryColor,
                        content: Text(
                          'Enter all the necessary information',
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
                  },
                  child: Text(
                    "Submit",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
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
}
