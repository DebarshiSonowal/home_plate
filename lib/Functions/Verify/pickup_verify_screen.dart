import 'dart:io';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:pluto_grid/pluto_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../CommonWidget/help_button.dart';
import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';
import '../OTP/Widgets/custom_checklist.dart';

class PickUpVerifyScreen extends StatefulWidget {
  const PickUpVerifyScreen({super.key, required this.id});

  final int id;

  @override
  State<PickUpVerifyScreen> createState() => _PickUpVerifyScreenState();
}

class _PickUpVerifyScreenState extends State<PickUpVerifyScreen> {
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
              "PICK UP",
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
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  // color: Colors.grey.shade400!.withOpacity(0.2),
                  // border: Border.symmetric(
                  //   horizontal: BorderSide(
                  //     color: Colors.grey.shade100.withOpacity(0.2),
                  //     width: 0.5.w,
                  //   ),
                  // ),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 7.h,
                width: double.infinity,
                child: Row(
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                              text:"Order Delivered To: ",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Constants.fourthColor,
                                // fontWeight: FontWeight.bold,
                                fontSize: 14.5.sp,
                              ),
                            ),
                            TextSpan(
                              text:Faker().person.name(),
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Constants.fourthColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.5.sp,
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
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
                    text:"Token Number:\n",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.fourthColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  TextSpan(
                    text:"T${Random().nextInt(100000)}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.sp,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 1.h,
            ),
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
                  Navigation.instance
                      .navigateAndRemoveUntil(Routes.tasksScreen, args: 0);

                },
                child: Text(
                  "Verified Pickup",
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
}
