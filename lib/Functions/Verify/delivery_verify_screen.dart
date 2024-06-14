import 'dart:io';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Constants/common_function.dart';
import 'package:home_plate/Repository/repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// import 'package:pluto_grid/pluto_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../CommonWidget/help_button.dart';
import '../../Constants/constants.dart';
import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';

class DeliveryVerifyScreen extends StatefulWidget {
  const DeliveryVerifyScreen({super.key, required this.id});

  final int id;

  @override
  State<DeliveryVerifyScreen> createState() => _DeliveryVerifyScreenState();
}

class _DeliveryVerifyScreenState extends State<DeliveryVerifyScreen> {
  XFile? selectedPhoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DELIVERY",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Constants.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
            ),
            AutoSizeText(
              "${Random.secure().nextInt(10000000)}${Random.secure().nextInt(10000000)}",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
            ),
          ],
        ),
        actions: const [
          HelpButton(),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Constants.bgColor,
        ),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  // color: Colors.grey.shade400!.withOpacity(0.2),
                  border: const Border.symmetric(
                      // horizontal: BorderSide(
                      //   color: Colors.grey.shade100.withOpacity(0.2),
                      //   width: 0.5.w,
                      // ),
                      ),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 7.h,
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: 70.w,
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Deliver to: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Constants.fourthColor,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14.5.sp,
                                  ),
                            ),
                            TextSpan(
                              text: Faker().person.name(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Constants.fourthColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.5.sp,
                                  ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.5.h,
                ),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  // color: Colors.grey.shade400!.withOpacity(0.2),
                  border: const Border.symmetric(
                      // horizontal: BorderSide(
                      //   color: Colors.grey.shade100.withOpacity(0.2),
                      //   width: 0.5.w,
                      // ),
                      ),
                  borderRadius: BorderRadius.circular(10),
                ),
                // height: 7.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70.w,
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Delivery Options",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Constants.fourthColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.5.sp,
                                  ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    SizedBox(
                      width: 70.w,
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "   Delivery Options >",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Constants.fourthColor,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14.5.sp,
                                  ),
                            ),
                            TextSpan(
                              text: " Leave at my door",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Constants.fourthColor,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14.5.sp,
                                  ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.5.h,
                ),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  // color: Colors.grey.shade400!.withOpacity(0.2),
                  border: const Border.symmetric(
                      // horizontal: BorderSide(
                      //   color: Colors.grey.shade100.withOpacity(0.2),
                      //   width: 0.5.w,
                      // ),
                      ),
                  borderRadius: BorderRadius.circular(10),
                ),
                // height: 7.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70.w,
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Delivery Instructions (Optional)",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Constants.fourthColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.5.sp,
                                  ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 0.8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Constants.bgColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Please ensure that the bank details are correct and  bank account in your name. Your payout will be account.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Constants.fourthColor,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 14.5.sp,
                                    ),
                              ),
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 80.w,
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Please Ask For The Delivery OTP from\n",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Constants.fourthColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                    ),
                    TextSpan(
                      text: Faker().person.name(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Constants.fourthColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            OtpTextField(
              numberOfFields: 4,
              borderColor: Constants.fourthColor,
              borderRadius: BorderRadius.circular(12),
              focusedBorderColor: Constants.fourthColor,
              filled: true,
              fieldWidth: 15.w,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {},
            ),
            SizedBox(
              height: 1.h,
            ),
            // SizedBox(
            //   width: 80.w,
            //   child: AutoSizeText(
            //     "Resend the OTP",
            //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
            //           color: Constants.secondaryColor,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 14.5.sp,
            //         ),
            //     maxLines: 1,
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            SizedBox(
              height: 2.h,
            ),

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Constants.bgColor,
                  border: Border.all(
                    color: Constants.primaryColor,
                    width: 1.2.w,
                  )),
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Click a photo of the product delivered to\n",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Constants.fourthColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                          ),
                          TextSpan(
                            text: Faker().person.name(),
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Constants.fourthColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.primaryColor,
                    ),
                    height: 22.h,
                    width: 75.w,
                    child: selectedPhoto == null
                        ? Center(
                            child: GestureDetector(
                              onTap: () {
                                pickPhoto();
                              },
                              child: Icon(
                                Icons.camera,
                                color: Constants.fourthColor,
                                size: 25.sp,
                              ),
                            ),
                          )
                        : Image.file(
                            File(selectedPhoto!.path),
                            fit: BoxFit.contain,
                          ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 6.h,
              width: 90.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Constants.seventhColor,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Constants.secondaryColor,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  verifyDelivery(context,widget.id.toString(),"0000");

                },
                child: Text(
                  "Verified Delivery",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List<PlutoColumn> columns = [
  //   /// Text Column definition
  //   PlutoColumn(
  //     minWidth: 10.w,
  //     width: 35.w,
  //     title: 'Food',
  //     field: 'food',
  //     type: PlutoColumnType.text(),
  //   ),
  //
  //   /// Select Column definition
  //   PlutoColumn(
  //     minWidth: 10.w,
  //     width: 20.w,
  //     title: 'Type',
  //     field: 'type',
  //     type: PlutoColumnType.select(['Full', 'Half']),
  //   ),
  //
  //   PlutoColumn(
  //     minWidth: 10.w,
  //     width: 20.w,
  //     title: 'QTY',
  //     field: 'qty',
  //     type: PlutoColumnType.number(),
  //   ),
  //
  //   /// Datetime Column definition
  //   PlutoColumn(
  //     minWidth: 10.w,
  //     width: 20.w,
  //     title: 'Verify',
  //     field: 'is_picked_up',
  //     type: PlutoColumnType.select(['Yes', 'No']),
  //   ),
  //
  //   /// Time Column definition
  // ];
  //
  // List<PlutoRow> rows = [
  //   PlutoRow(
  //     cells: {
  //       'food': PlutoCell(value: 'Chicken Butter Masala'),
  //       'type': PlutoCell(value: 'Full'),
  //       'qty': PlutoCell(value: 150),
  //       'is_picked_up': PlutoCell(value: 'No'),
  //     },
  //   ),
  //   PlutoRow(
  //     cells: {
  //       'food': PlutoCell(value: 'Biriyani'),
  //       'type': PlutoCell(value: 'Half'),
  //       'qty': PlutoCell(value: 200),
  //       'is_picked_up': PlutoCell(value: 'No'),
  //     },
  //   ),
  //   PlutoRow(
  //     cells: {
  //       'food': PlutoCell(value: 'Special Thali'),
  //       'type': PlutoCell(value: 'Full'),
  //       'qty': PlutoCell(value: 390),
  //       'is_picked_up': PlutoCell(value: 'No'),
  //     },
  //   ),
  // ];

  Future<void> pickPhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    // final XFile? media = await picker.pickMedia();
    setState(() {
      selectedPhoto = photo;
    });
  }

  void verifyDelivery(BuildContext context,String order_id,String otp) async {
    CommonFunction().showLoadingDialog(context);
    final data = Provider.of<Repository>(context, listen: false).profile;
    final response = await ApiProvider.instance.acceptedOrderStatus(
        (data?.id ?? 0).toString(), order_id,'3', otp, (selectedPhoto?.path ?? ""));
    if (response.status ?? false) {
      CommonFunction().hideLoadingDialog(context);
      CommonFunction().showSuccessSnackBar(
          context, response.message, "Order Delivered Successfully");
      Navigation.instance
          .navigate(Routes.getOrderScreen);
    } else {
      CommonFunction().hideLoadingDialog(context);
      CommonFunction()
          .showErrorSnackBar(context, response.message, "Something went wrong");
    }
  }
}
